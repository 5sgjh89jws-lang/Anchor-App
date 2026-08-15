import 'package:flutter/material.dart';
import '../home_screen.dart';

class Checkin5Screen extends StatefulWidget {
  const Checkin5Screen({super.key});

  @override
  State<Checkin5Screen> createState() => _Checkin5ScreenState();
}

class _Checkin5ScreenState extends State<Checkin5Screen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut));
    _fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));
    Future.delayed(const Duration(milliseconds: 100), () {
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated ring
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0x33C9A84C), width: 1.5)),
                    child: Center(
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0x1AC9A84C),
                            border: Border.all(color: const Color(0x33C9A84C))),
                        child: const Center(
                            child: Text('✦',
                                style: TextStyle(
                                    fontSize: 26, color: Color(0xFFC9A84C)))),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      const Text('DAY 14 COMPLETE',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFC9A84C),
                              letterSpacing: 1.4)),
                      const SizedBox(height: 12),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFEDEAE0),
                              height: 1.15),
                          children: [
                            TextSpan(text: 'Two weeks.\n'),
                            TextSpan(
                                text: 'That\'s remarkable.',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFC9A84C))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'You didn\'t just resist tonight. You proved to yourself, one more time, who you\'re becoming.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 13,
                            color: Color(0xFF8A8780),
                            height: 1.65),
                      ),
                      const SizedBox(height: 20),

                      // Identity card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: const Color(0x0DC9A84C),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0x33C9A84C))),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('IDENTITY REINFORCED',
                                  style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFC9A84C),
                                      letterSpacing: 0.8)),
                              SizedBox(height: 5),
                              Text(
                                  '"I am becoming someone who chooses presence over escape."',
                                  style: TextStyle(
                                      fontFamily: 'Fraunces',
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: Color(0xFFEDEAE0),
                                      height: 1.5)),
                            ]),
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()),
                              (route) => false),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFC9A84C),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              elevation: 0),
                          child: const Text('Rest well. See you tomorrow. →',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0A0B09))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
