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

// ══════════════════════════════════════
// SPLASH SCREEN
// ══════════════════════════════════════
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _textController;
  late Animation<double> _textAnimation;
  late AnimationController _dot1Controller;
  late AnimationController _dot2Controller;
  late AnimationController _dot3Controller;
  late Animation<double> _dot1Animation;
  late Animation<double> _dot2Animation;
  late Animation<double> _dot3Animation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOut),
    );
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _scaleController.forward();
    });

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _textController.forward();
    });

    _dot1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _dot1Animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _dot1Controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _dot1Controller.repeat(reverse: true);
    });

    _dot2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _dot2Animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _dot2Controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _dot2Controller.repeat(reverse: true);
    });

    _dot3Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _dot3Animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _dot3Controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) _dot3Controller.repeat(reverse: true);
    });

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
    _fadeController.dispose();
    _scaleController.dispose();
    _textController.dispose();
    _dot1Controller.dispose();
    _dot2Controller.dispose();
    _dot3Controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) => Opacity(opacity: animation.value, child: child),
      child: Container(
        width: 7,
        height: 7,
        decoration: const BoxDecoration(
          color: Color(0xFFC9A84C),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [

            // ── BACKGROUND ──
            Container(
              width: screenWidth,
              height: screenHeight,
              color: const Color(0xFF0A0B09),
            ),

            // ── GRID TEXTURE ──
            // Using LayoutBuilder to ensure perfect alignment
            LayoutBuilder(
              builder: (context, constraints) {
                return Opacity(
                  opacity: 0.025,
                  child: CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: GridPainter(),
                  ),
                );
              },
            ),

            // ── GLOW ORB TOP RIGHT ──
            // Soft atmospheric glow — not a solid circle
            Positioned(
              top: -120,
              right: -120,
              child: Container(
                width: 320,
                height: 320,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.5,
                    colors: [
                      Color(0x26C9A84C), // 15% opacity at center
                      Color(0x0DC9A84C), // 5% opacity mid
                      Color(0x00C9A84C), // 0% at edge
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // ── GLOW ORB BOTTOM LEFT ──
            Positioned(
              bottom: -80,
              left: -80,
              child: Container(
                width: 240,
                height: 240,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.5,
                    colors: [
                      Color(0x14C9A84C), // 8% opacity at center
                      Color(0x06C9A84C), // 2% opacity mid
                      Color(0x00C9A84C), // 0% at edge
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // ── MAIN CONTENT ──
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Center logo
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // ── ANCHOR ICON ──
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              // Very subtle gold tint — not too opaque
                              color: const Color(0x0DC9A84C),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: const Color(0x26C9A84C),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.anchor,
                                color: Color(0xFFC9A84C),
                                size: 34,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ── APP NAME ──
                        FadeTransition(
                          opacity: _textAnimation,
                          child: const Text(
                            'Anchor',
                            style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 32,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFEDEAE0),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // ── TAGLINE ──
                        FadeTransition(
                          opacity: _textAnimation,
                          child: const Text(
                            'Stay Grounded',
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8A8780),
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── PULSING DOTS ──
                  Padding(
                    padding: const EdgeInsets.only(bottom: 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(_dot1Animation),
                        const SizedBox(width: 6),
                        _buildDot(_dot2Animation),
                        const SizedBox(width: 6),
                        _buildDot(_dot3Animation),
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
}



// ══════════════════════════════════════
// GRID PAINTER — perfectly even grid
// ══════════════════════════════════════
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..isAntiAlias = false; // crisp lines, no blurring

    const double cellSize = 30.0;

    // Calculate exact number of cells that fit
    final int cols = (size.width / cellSize).ceil();
    final int rows = (size.height / cellSize).ceil();

    // Draw vertical lines
    for (int i = 0; i <= cols; i++) {
      final x = i * cellSize;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (int i = 0; i <= rows; i++) {
      final y = i * cellSize;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}