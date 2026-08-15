import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const AnchorApp());
}

class AnchorApp extends StatelessWidget {
  const AnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anchor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DM Sans'),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Anchor glow animation — gold to bright gold and back
  late AnimationController _glowController;
  late Animation<Color?> _glowColor;

  // Dots pulse
  late AnimationController _dot1Controller;
  late AnimationController _dot2Controller;
  late AnimationController _dot3Controller;
  late Animation<double> _dot1;
  late Animation<double> _dot2;
  late Animation<double> _dot3;

  // Fade in
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    // Anchor glow — smooth color pulse
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _glowColor = ColorTween(
      begin: const Color(0xFFC9A84C),
      end: const Color(0xFFFFF0A0),
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));

    // Screen fade in
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    // Dot 1
    _dot1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _dot1 = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _dot1Controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _dot1Controller.repeat(reverse: true);
    });

    // Dot 2
    _dot2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _dot2 = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _dot2Controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _dot2Controller.repeat(reverse: true);
    });

    // Dot 3
    _dot3Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _dot3 = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _dot3Controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) _dot3Controller.repeat(reverse: true);
    });

    // Navigate after 6 seconds
    Future.delayed(const Duration(milliseconds: 6000), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const WelcomeScreen(),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _glowController.dispose();
    _fadeController.dispose();
    _dot1Controller.dispose();
    _dot2Controller.dispose();
    _dot3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Stack(
          children: [
            // ── BACKGROUND GOLD GLOW TOP RIGHT ──
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 320,
                height: 320,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0x0DC9A84C),
                      Color(0x06C9A84C),
                      Color(0x00C9A84C),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // ── BACKGROUND GOLD GLOW BOTTOM LEFT ──
            Positioned(
              bottom: -60,
              left: -60,
              child: Container(
                width: 220,
                height: 220,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0x08C9A84C),
                      Color(0x00C9A84C),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),

            // ── MAIN CONTENT ──
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Center — logo + text
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ── GLOWING ANCHOR ICON ──
                        AnimatedBuilder(
                          animation: _glowColor,
                          builder: (context, child) {
                            final color =
                                _glowColor.value ?? const Color(0xFFC9A84C);
                            return CustomPaint(
                              size: const Size(60, 60),
                              painter: AnchorPainter(color: color),
                            );
                          },
                        ),

                        const SizedBox(height: 28),

                        // ── APP NAME ──
                        const Text(
                          'Anchor',
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFEDEAE0),
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // ── TAGLINE ──
                        const Text(
                          'Stay Grounded',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 11,
                            color: Color(0xFF4A4845),
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── PULSING DOTS ──
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(_dot1),
                        const SizedBox(width: 6),
                        _buildDot(_dot2),
                        const SizedBox(width: 6),
                        _buildDot(_dot3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(Animation<double> anim) {
    return AnimatedBuilder(
      animation: anim,
      builder: (_, __) => Opacity(
        opacity: anim.value,
        child: Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: Color(0xFFC9A84C),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

// ── ANCHOR PAINTER ──
// Draws the anchor outline in a given color — no box, no background
class AnchorPainter extends CustomPainter {
  final Color color;
  const AnchorPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final cx = size.width / 2;
    final cy = size.height / 2;

    // Circle at top
    canvas.drawCircle(Offset(cx, cy - 14), 9, paint);

    // Vertical stem
    canvas.drawLine(
      Offset(cx, cy - 5),
      Offset(cx, cy + 12),
      paint,
    );

    // Horizontal crossbar
    canvas.drawLine(
      Offset(cx - 14, cy + 5),
      Offset(cx + 14, cy + 5),
      paint,
    );

    // Bottom semicircle
    final path = Path();
    path.moveTo(cx - 14, cy + 5);
    path.quadraticBezierTo(cx - 14, cy + 20, cx, cy + 20);
    path.quadraticBezierTo(cx + 14, cy + 20, cx + 14, cy + 5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AnchorPainter oldDelegate) => oldDelegate.color != color;
}
