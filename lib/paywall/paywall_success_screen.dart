import '../onboarding/onboarding_1_screen.dart';
import 'package:flutter/material.dart';

class PaywallSuccessScreen extends StatefulWidget {
  final String plan;
  const PaywallSuccessScreen({super.key, required this.plan});

  @override
  State<PaywallSuccessScreen> createState() => _PaywallSuccessScreenState();
}

class _PaywallSuccessScreenState extends State<PaywallSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut));
    _fadeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));
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
    final isAnnual = widget.plan == 'annual';
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color(0x33C9A84C), width: 1.5),
                    ),
                    child: Center(
                      child: Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0x1AC9A84C),
                          border: Border.all(color: const Color(0x33C9A84C)),
                        ),
                        child: const Center(
                            child: Text('✦',
                                style: TextStyle(
                                    fontSize: 24, color: Color(0xFFC9A84C)))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      const Text('YOU\'RE ALL SET',
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
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFEDEAE0),
                              height: 1.15),
                          children: [
                            TextSpan(text: 'Welcome to '),
                            TextSpan(
                                text: 'Anchor.',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFC9A84C))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C18),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('YOUR PLAN',
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4A4845),
                                    letterSpacing: 0.7)),
                            const SizedBox(height: 6),
                            Text(
                              isAnnual
                                  ? 'Anchor Annual — \$59.99/yr'
                                  : 'Anchor Monthly — \$9.99/mo',
                              style: const TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFEDEAE0)),
                            ),
                            const SizedBox(height: 4),
                            const Text('First charge after free trial ends',
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12,
                                    color: Color(0xFF4A4845))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Onboarding1Screen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC9A84C),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 0,
                          ),
                          child: const Text('Begin my journey →',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 17,
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
