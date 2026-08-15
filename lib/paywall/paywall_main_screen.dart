import 'package:flutter/material.dart';
import 'paywall_success_screen.dart';

class PaywallMainScreen extends StatefulWidget {
  const PaywallMainScreen({super.key});

  @override
  State<PaywallMainScreen> createState() => _PaywallMainScreenState();
}

class _PaywallMainScreenState extends State<PaywallMainScreen> {
  String _selectedPlan = 'annual';
  bool _showExitIntent = false;
  int _countdown = 899;

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _showExitIntent && _countdown > 0) {
        setState(() => _countdown--);
        _startCountdown();
      }
    });
  }

  String get _countdownText {
    final m = _countdown ~/ 60;
    final s = _countdown % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Crown icon
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0x1AC9A84C),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0x33C9A84C)),
                    ),
                    child: const Center(
                      child: Text('👑', style: TextStyle(fontSize: 26)),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text('UNLOCK EVERYTHING',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC9A84C),
                          letterSpacing: 1.4)),

                  const SizedBox(height: 10),

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
                        TextSpan(text: 'Start your free '),
                        TextSpan(
                            text: 'trial.',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFC9A84C))),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Annual plan
                  GestureDetector(
                    onTap: () => setState(() => _selectedPlan = 'annual'),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _selectedPlan == 'annual'
                                ? const Color(0x1AC9A84C)
                                : const Color(0xFF1A1C18),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: _selectedPlan == 'annual'
                                  ? const Color(0x59C9A84C)
                                  : Colors.white.withValues(alpha: 0.07),
                              width: _selectedPlan == 'annual' ? 1.5 : 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Annual',
                                      style: TextStyle(
                                          fontFamily: 'DM Sans',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFEDEAE0))),
                                  const Text('\$59.99',
                                      style: TextStyle(
                                          fontFamily: 'Fraunces',
                                          fontSize: 22,
                                          color: Color(0xFFC9A84C))),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text('\$4.99/month · billed once per year',
                                  style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 12,
                                      color: Color(0xFF8A8780))),
                              const SizedBox(height: 4),
                              const Text('Save 50% vs monthly',
                                  style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 12,
                                      color: Color(0xFF3D6B4A))),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: const BoxDecoration(
                              color: Color(0xFFC9A84C),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(14),
                                  bottomLeft: Radius.circular(8)),
                            ),
                            child: const Text('BEST VALUE',
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0A0B09))),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Monthly plan
                  GestureDetector(
                    onTap: () => setState(() => _selectedPlan = 'monthly'),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _selectedPlan == 'monthly'
                            ? const Color(0x1AC9A84C)
                            : const Color(0xFF1A1C18),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: _selectedPlan == 'monthly'
                              ? const Color(0x59C9A84C)
                              : Colors.white.withValues(alpha: 0.07),
                          width: _selectedPlan == 'monthly' ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Monthly',
                                  style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFEDEAE0))),
                              const SizedBox(height: 4),
                              const Text('per month · cancel anytime',
                                  style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 12,
                                      color: Color(0xFF8A8780))),
                            ],
                          ),
                          const Text('\$9.99',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 22,
                                  color: Color(0xFFEDEAE0))),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Features list
                  ...[
                    'Unlimited check-ins + streak tracking',
                    'Trigger pattern insights (day 14)',
                    'Full panic mode toolkit',
                    'Accountability partner sharing',
                    'Anonymous community access',
                  ].map((f) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Text('✦',
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFFC9A84C))),
                            const SizedBox(width: 10),
                            Text(f,
                                style: const TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 13,
                                    color: Color(0xFF8A8780))),
                          ],
                        ),
                      )),

                  const SizedBox(height: 16),

                  // Trust badge
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0x0D3D6B4A),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0x333D6B4A)),
                    ),
                    child: const Text(
                        '🛡️  7-day free trial · No charge today · Cancel anytime',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 12,
                            color: Color(0xFF8A8780))),
                  ),

                  const SizedBox(height: 16),

                  // CTA button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PaywallSuccessScreen(plan: _selectedPlan)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9A84C),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      child: const Text('Start free trial →',
                          style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0A0B09))),
                    ),
                  ),

                  const SizedBox(height: 12),

                  GestureDetector(
                    onTap: () {
                      setState(() => _showExitIntent = true);
                      _startCountdown();
                    },
                    child: const Text('Continue with limited free plan',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 13,
                            color: Color(0xFF4A4845))),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Exit intent popup
          if (_showExitIntent)
            Container(
              color: Colors.black.withValues(alpha: 0.7),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Color(0xFF111310),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    border: Border(top: BorderSide(color: Color(0x33FFFFFF))),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0x1AC0483C),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: const Color(0x33C0483C)),
                        ),
                        child: Text('⏱  Offer expires in $_countdownText',
                            style: const TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 12,
                                color: Color(0xFFC0483C),
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 16),
                      const Text('⚡', style: TextStyle(fontSize: 28)),
                      const SizedBox(height: 8),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFEDEAE0),
                              height: 1.15),
                          children: [
                            TextSpan(text: 'Wait — '),
                            TextSpan(
                                text: '50% off,',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFC9A84C))),
                            TextSpan(text: '\ntoday only.'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          'One-time offer. Annual access for just \$29.99 — that\'s \$2.50 a month.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 13,
                              color: Color(0xFF8A8780))),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PaywallSuccessScreen(
                                        plan: 'annual')));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC9A84C),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 0,
                          ),
                          child: const Text('Claim 50% off — \$29.99/yr',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0A0B09))),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => setState(() => _showExitIntent = false),
                        child: const Text('No thanks, continue free',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 13,
                                color: Color(0xFF4A4845))),
                      ),
                      const SizedBox(height: 8),
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
