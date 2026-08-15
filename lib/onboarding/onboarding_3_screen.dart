import 'package:flutter/material.dart';
import 'onboarding_4_screen.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Onboarding4Screen())),
                  child: const Text('Skip',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 13,
                          color: Color(0xFF4A4845))),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                    color: const Color(0x1AC9A84C),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0x33C9A84C))),
                child: const Center(
                    child: Text('🛡️', style: TextStyle(fontSize: 28))),
              ),
              const SizedBox(height: 24),
              const Text('PANIC MODE',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFC9A84C),
                      letterSpacing: 1.4)),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEDEAE0),
                      height: 1.15,
                      letterSpacing: -0.5),
                  children: [
                    TextSpan(text: 'When urges hit '),
                    TextSpan(
                        text: 'hard.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC9A84C))),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                  'Panic mode gives you a 5-minute breathing timer, proven grounding techniques, and instant access to your accountability partner.',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 15,
                      color: Color(0xFF8A8780),
                      height: 1.65)),
              const SizedBox(height: 24),
              _featureRow('⏱️', '5-minute breathing timer',
                  'Urges peak and fade in 20 minutes'),
              const SizedBox(height: 10),
              _featureRow('🧠', 'Grounding techniques',
                  'Box breathing, cold water, 5-4-3-2-1'),
              const SizedBox(height: 10),
              _featureRow('📱', 'Text your partner',
                  'Instant SOS to your accountability partner'),
              const SizedBox(height: 10),
              _featureRow('🔄', 'Dopamine swap',
                  'Replace the urge with something real'),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (i) => Container(
                          width: i == 2 ? 18 : 7,
                          height: 7,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: i == 2
                                  ? const Color(0xFFC9A84C)
                                  : Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4)),
                        )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Onboarding4Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('Get started →',
                      style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A0B09))),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureRow(String emoji, String title, String sub) {
    return Row(
      children: [
        Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                color: const Color(0x1AC9A84C),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0x33C9A84C))),
            child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 16)))),
        const SizedBox(width: 12),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFEDEAE0))),
          Text(sub,
              style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 11,
                  color: Color(0xFF8A8780))),
        ])),
      ],
    );
  }
}
