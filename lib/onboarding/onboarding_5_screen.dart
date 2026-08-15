import 'package:flutter/material.dart';
import 'onboarding_6_screen.dart';

class Onboarding5Screen extends StatefulWidget {
  const Onboarding5Screen({super.key});

  @override
  State<Onboarding5Screen> createState() => _Onboarding5ScreenState();
}

class _Onboarding5ScreenState extends State<Onboarding5Screen> {
  int _selected = 0;

  final List<String> _completions = [
    'chooses presence over escape.',
    'values real connection.',
    'is free from this.',
    'shows up for the people I love.',
    'is in control of his mind.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    const Text('YOUR IDENTITY',
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
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEDEAE0),
                            height: 1.15,
                            letterSpacing: -0.5),
                        children: [
                          TextSpan(text: 'Complete your '),
                          TextSpan(
                              text: 'identity',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' statement.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'This becomes your daily reminder of who you\'re becoming.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780),
                            height: 1.5)),
                    const SizedBox(height: 24),

                    // Identity preview card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0x0DC9A84C),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0x33C9A84C))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('"',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 28,
                                  color: Color(0x26C9A84C),
                                  height: 0.8)),
                          const SizedBox(height: 4),
                          const Text('I am becoming someone who...',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 12,
                                  color: Color(0xFF4A4845),
                                  fontStyle: FontStyle.italic)),
                          const SizedBox(height: 6),
                          Text(_completions[_selected],
                              style: const TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFEDEAE0))),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Options
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(_completions.length, (index) {
                        final isSelected = _selected == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selected = index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0x1AC9A84C)
                                  : const Color(0xFF1A1C18),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: isSelected
                                      ? const Color(0x59C9A84C)
                                      : Colors.white.withValues(alpha: 0.07),
                                  width: isSelected ? 1.5 : 1),
                            ),
                            child: Text(_completions[index],
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 13,
                                    color: isSelected
                                        ? const Color(0xFFEDEAE0)
                                        : const Color(0xFF8A8780))),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Onboarding6Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('This is who I\'m becoming →',
                      style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A0B09))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
