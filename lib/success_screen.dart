import 'package:flutter/material.dart';
import 'paywall/paywall_main_screen.dart';
import 'widgets/anchor_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _scaleController.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: Stack(
        children: [
          // ── GLOW ──
          Positioned(
            top: -100,
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
                      Color(0x06C9A84C),
                      Color(0x00C9A84C),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // ── CONTENT ──
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ── ANIMATED RING + ICON ──
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0x33C9A84C),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0x1AC9A84C),
                              border: Border.all(
                                color: const Color(0x33C9A84C),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '✦',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFFC9A84C),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── EYEBROW ──
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        'ACCOUNT VERIFIED',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC9A84C),
                          letterSpacing: 1.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── HEADLINE ──
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEDEAE0),
                            height: 1.15,
                            letterSpacing: -0.5,
                          ),
                          children: [
                            TextSpan(text: "You're "),
                            TextSpan(
                              text: 'in.',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFC9A84C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── BODY ──
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: const Text(
                        'The decision to show up is the hardest part. You\'ve already made it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8A8780),
                          height: 1.65,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ── CTA BUTTON ──
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: AnchorPrimaryButton(
                        label: 'Begin my journey',
                        icon: Icons.arrow_forward,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PaywallMainScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
