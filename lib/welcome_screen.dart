import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            // ── BACKGROUND ──
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFF0A0B09),
            ),

            // ── GRID TEXTURE ──
            LayoutBuilder(
              builder: (context, constraints) {
                return Opacity(
                  opacity: 0.025,
                  child: CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: _GridPainter(),
                  ),
                );
              },
            ),

            // ── GOLD GLOW ORB — TOP CENTER ──
            Positioned(
              top: -120,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 360,
                  height: 360,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 0.5,
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
            ),

            // ── MAIN CONTENT ──
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: screenHeight * 0.06),

                    // ── EYEBROW ──
                    const Text(
                      'YOUR COMEBACK STARTS NOW',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFC9A84C),
                        letterSpacing: 1.4,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── HEADLINE ──
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEDEAE0),
                          height: 1.1,
                          letterSpacing: -0.5,
                        ),
                        children: [
                          TextSpan(text: "You're stronger\nthan you "),
                          TextSpan(
                            text: 'think',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC9A84C),
                            ),
                          ),
                          TextSpan(text: '\nyou are.'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── BODY TEXT ──
                    const Text(
                      'Thousands of men have broken free using the same tools you\'re about to unlock. Today is day one.',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8A8780),
                        height: 1.65,
                      ),
                    ),

                    const Spacer(),

                    // ── SOCIAL PROOF CARD ──
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.03),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.07),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 76,
                            height: 28,
                            child: Stack(
                              children: [
                                _buildAvatar(0, 'MK',
                                    const Color(0xFF2A3828),
                                    const Color(0xFF6AAB7A)),
                                _buildAvatar(1, 'JR',
                                    const Color(0xFF2A2828),
                                    const Color(0xFFAB8A6A)),
                                _buildAvatar(2, 'TW',
                                    const Color(0xFF28282A),
                                    const Color(0xFF8A6AAB)),
                                _buildAvatar(3, '+',
                                    const Color(0xFF1A1C18),
                                    const Color(0xFFC9A84C)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                                children: [
                                  TextSpan(
                                    text: '12,400+ people',
                                    style: TextStyle(
                                      color: Color(0xFFEDEAE0),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' are on their streak right now.',
                                    style: TextStyle(
                                      color: Color(0xFF8A8780),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── PRIMARY BUTTON ──
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignUpScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC9A84C),
                          foregroundColor: const Color(0xFF0A0B09),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Start my recovery  →',
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A0B09),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ── SECONDARY BUTTON ──
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LoginScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.12),
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'I already have an account',
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8A8780),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(int index, String text, Color bg, Color textColor) {
    return Positioned(
      left: index * 19.0,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF0A0B09),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: index == 3 ? 9 : 10,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ── GRID PAINTER ──
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..isAntiAlias = false;

    const double cellSize = 30.0;
    final int cols = (size.width / cellSize).ceil();
    final int rows = (size.height / cellSize).ceil();

    for (int i = 0; i <= cols; i++) {
      final x = i * cellSize;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (int i = 0; i <= rows; i++) {
      final y = i * cellSize;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}