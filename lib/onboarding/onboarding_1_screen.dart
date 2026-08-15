import 'package:flutter/material.dart';
import 'onboarding_2_screen.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

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

              // Skip
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Onboarding2Screen()));
                  },
                  child: const Text('Skip',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 13,
                          color: Color(0xFF4A4845))),
                ),
              ),

              const SizedBox(height: 32),

              // Icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0x1AC9A84C),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0x33C9A84C)),
                ),
                child: const Center(
                    child: Text('🧠', style: TextStyle(fontSize: 28))),
              ),

              const SizedBox(height: 24),

              // Eyebrow
              const Text('THE SCIENCE BEHIND IT',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFC9A84C),
                      letterSpacing: 1.4)),

              const SizedBox(height: 12),

              // Headline
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
                    TextSpan(text: 'Your brain can '),
                    TextSpan(
                        text: 'rewire itself.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC9A84C))),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Every day without it, your dopamine system heals. Most users report meaningfully weaker urges within just 14 days.',
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 15,
                    color: Color(0xFF8A8780),
                    height: 1.65),
              ),

              const SizedBox(height: 32),

              // Stats card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C18),
                  borderRadius: BorderRadius.circular(14),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.07)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('14',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 32,
                                  color: Color(0xFFC9A84C),
                                  fontWeight: FontWeight.w300)),
                          const Text('days to first shift',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 11,
                                  color: Color(0xFF4A4845))),
                        ],
                      ),
                    ),
                    Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withValues(alpha: 0.07)),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('91%',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 32,
                                  color: Color(0xFFC9A84C),
                                  fontWeight: FontWeight.w300)),
                          const Text('report fewer urges',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 11,
                                  color: Color(0xFF4A4845))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (i) => Container(
                          width: i == 0 ? 18 : 7,
                          height: 7,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: i == 0
                                ? const Color(0xFFC9A84C)
                                : Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Onboarding2Screen())),
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
}
