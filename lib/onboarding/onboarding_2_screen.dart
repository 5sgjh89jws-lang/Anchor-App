import 'package:flutter/material.dart';
import 'onboarding_3_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

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
                      MaterialPageRoute(builder: (_) => Onboarding3Screen())),
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
                    child: Text('📊', style: TextStyle(fontSize: 28))),
              ),
              const SizedBox(height: 24),
              const Text('YOUR PATTERN INSIGHTS',
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
                    TextSpan(text: 'We learn your '),
                    TextSpan(
                        text: 'triggers.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC9A84C))),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                  'After 14 days of check-ins, Anchor identifies exactly when and why your urges hit — and builds a plan around your patterns.',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 15,
                      color: Color(0xFF8A8780),
                      height: 1.65)),
              const SizedBox(height: 24),
              _insightCard('🌙', 'Danger window', 'Late night 9–11pm',
                  const Color(0xFFC0483C)),
              const SizedBox(height: 10),
              _insightCard(
                  '⚡', 'Primary trigger', 'Stress', const Color(0xFFC9A84C)),
              const SizedBox(height: 10),
              _insightCard('📉', 'Urge trend', 'Down 38% this week',
                  const Color(0xFF3D6B4A)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (i) => Container(
                          width: i == 1 ? 18 : 7,
                          height: 7,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: i == 1
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
                      MaterialPageRoute(builder: (_) => Onboarding3Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('Next →',
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

  Widget _insightCard(String emoji, String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1C18),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07))),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
              child: Text(label,
                  style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 13,
                      color: Color(0xFF8A8780)))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: color.withValues(alpha: 0.3))),
            child: Text(value,
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: color)),
          ),
        ],
      ),
    );
  }
}
