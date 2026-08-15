import 'package:flutter/material.dart';
import 'onboarding_8_screen.dart';

class Onboarding7Screen extends StatefulWidget {
  const Onboarding7Screen({super.key});

  @override
  State<Onboarding7Screen> createState() => _Onboarding7ScreenState();
}

class _Onboarding7ScreenState extends State<Onboarding7Screen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    const Text('LETTER TO FUTURE SELF',
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
                          TextSpan(text: 'Write a letter to your '),
                          TextSpan(
                              text: 'future self.',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'It unlocks at day 30. Future you is counting on present you.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780),
                            height: 1.5)),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1A1C18),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('"',
                              style: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 32,
                                  color: Color(0x26C9A84C),
                                  height: 0.8)),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _controller,
                            maxLines: 8,
                            style: const TextStyle(
                                fontFamily: 'Fraunces',
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFFEDEAE0),
                                height: 1.6),
                            decoration: const InputDecoration(
                              hintText:
                                  'Dear future me,\n\nI\'m starting this today because...',
                              hintStyle: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF4A4845),
                                  height: 1.6),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.lock_outline,
                                  size: 12, color: Color(0xFF4A4845)),
                              const SizedBox(width: 4),
                              const Text('Unlocks at Day 30',
                                  style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 10,
                                      color: Color(0xFF4A4845))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                        child: Text('Skip for now',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 13,
                                color: Color(0xFF4A4845)))),
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
                      MaterialPageRoute(builder: (_) => Onboarding8Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('Seal my letter →',
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
