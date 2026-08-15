import 'package:flutter/material.dart';
import 'quiz_2_screen.dart';

class Quiz1Screen extends StatefulWidget {
  const Quiz1Screen({super.key});

  @override
  State<Quiz1Screen> createState() => _Quiz1ScreenState();
}

class _Quiz1ScreenState extends State<Quiz1Screen> {
  int _selected = -1;

  final List<Map<String, String>> _options = [
    {'emoji': '🌱', 'label': 'Less than 3 months'},
    {'emoji': '📅', 'label': '3 to 12 months'},
    {'emoji': '📆', 'label': '1 to 3 years'},
    {'emoji': '🔁', 'label': 'More than 3 years'},
    {'emoji': '❓', 'label': 'I\'m not sure'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            // ── PROGRESS BAR ──
            _buildProgressBar(1),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.chevron_left,
                              color: Color(0xFF8A8780), size: 20),
                          SizedBox(width: 4),
                          Text('Back',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 14,
                                  color: Color(0xFF8A8780))),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Eyebrow
                    const Text(
                      'BUILDING YOUR PLAN',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFC9A84C),
                        letterSpacing: 1.4,
                      ),
                    ),

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
                          letterSpacing: -0.5,
                        ),
                        children: [
                          TextSpan(
                              text: 'How long have you\nbeen dealing with '),
                          TextSpan(
                            text: 'this?',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC9A84C),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'There\'s no wrong answer. This helps us set realistic expectations.',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 14,
                        color: Color(0xFF8A8780),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Options
                    ...List.generate(_options.length, (index) {
                      final isSelected = _selected == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selected = index),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0x1AC9A84C)
                                : const Color(0xFF1A1C18),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0x59C9A84C)
                                  : Colors.white.withValues(alpha: 0.07),
                              width: isSelected ? 1.5 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(_options[index]['emoji']!,
                                  style: const TextStyle(fontSize: 20)),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  _options[index]['label']!,
                                  style: const TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 15,
                                    color: Color(0xFFEDEAE0),
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFC9A84C),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.check,
                                      color: Color(0xFF0A0B09), size: 12),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // ── CONTINUE BUTTON ──
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selected >= 0
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Quiz2Screen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC9A84C),
                    disabledBackgroundColor:
                        Colors.white.withValues(alpha: 0.08),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue →',
                    style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: _selected >= 0
                          ? const Color(0xFF0A0B09)
                          : const Color(0xFF4A4845),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(int current) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 0),
      child: Row(
        children: List.generate(10, (index) {
          return Expanded(
            child: Container(
              height: 3,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: index < current
                    ? const Color(0xFFC9A84C)
                    : Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
