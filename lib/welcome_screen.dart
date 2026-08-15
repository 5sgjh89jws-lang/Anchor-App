import 'package:flutter/material.dart';
import 'quiz/quiz_1_screen.dart';
import 'login_screen.dart';
import 'widgets/anchor_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: Stack(
        children: [
          // ── BACKGROUND GLOW TOP ──
          Positioned(
            top: -80,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0x0DC9A84C),
                      Color(0x00C9A84C),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // ── BACKGROUND GLOW BOTTOM ──
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
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      const Spacer(),

                      // ── QUOTE SECTION ──
                      Column(
                        children: [
                          // Opening quote mark
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '"',
                              style: TextStyle(
                                fontFamily: 'Fraunces',
                                fontSize: 64,
                                color: Color(0x33C9A84C),
                                height: 0.8,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Quote text
                          const Text(
                            'Pornography is a public health crisis. It rewires the brain, destroys relationships, and robs men of their potential — one click at a time.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFFEDEAE0),
                              height: 1.6,
                              letterSpacing: -0.2,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Divider line
                          Center(
                            child: Container(
                              width: 40,
                              height: 1,
                              color: const Color(0x33C9A84C),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Author
                          const Text(
                            'Dr. Gary Wilson',
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC9A84C),
                              letterSpacing: 0.3,
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'Author of Your Brain on Porn',
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 11,
                              color: Color(0xFF4A4845),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // ── BOTTOM BUTTONS ──
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Sign In — left
                            AnchorGhostButton(
                              label: 'Sign in',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginScreen(),
                                  ),
                                );
                              },
                            ),

                            // Continue → right
                            AnchorPrimaryButton(
                              label: 'Continue',
                              icon: Icons.arrow_forward,
                              expand: false,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Quiz1Screen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
