import 'package:flutter/material.dart';
import 'quiz_3_screen.dart';
import '../widgets/anchor_button.dart';

class Quiz2Screen extends StatefulWidget {
  const Quiz2Screen({super.key});

  @override
  State<Quiz2Screen> createState() => _Quiz2ScreenState();
}

class _Quiz2ScreenState extends State<Quiz2Screen> {
  final List<String> _selected = [];

  final List<Map<String, String>> _options = [
    {'emoji': '😴', 'label': 'Boredom'},
    {'emoji': '😰', 'label': 'Stress'},
    {'emoji': '😔', 'label': 'Loneliness'},
    {'emoji': '🌙', 'label': 'Late at night'},
    {'emoji': '😟', 'label': 'Anxiety'},
    {'emoji': '🏠', 'label': 'Home alone'},
    {'emoji': '📱', 'label': 'Social media'},
    {'emoji': '😩', 'label': 'Tired'},
    {'emoji': '⏳', 'label': 'Procrastinating'},
    {'emoji': '😡', 'label': 'After argument'},
    {'emoji': '😢', 'label': 'Sadness'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressBar(2),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
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
                    const Text('BUILDING YOUR PLAN',
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
                          TextSpan(text: 'What '),
                          TextSpan(
                              text: 'triggers',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' your urges most often?'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'Select all that apply. Builds your pattern insights from day one.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780),
                            height: 1.5)),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _options.map((option) {
                        final isSelected = _selected.contains(option['label']);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selected.remove(option['label']);
                              } else {
                                _selected.add(option['label']!);
                              }
                            });
                          },
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
                                width: isSelected ? 1.5 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(option['emoji']!,
                                    style: const TextStyle(fontSize: 16)),
                                const SizedBox(width: 6),
                                Text(option['label']!,
                                    style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 14,
                                        color: isSelected
                                            ? const Color(0xFFEDEAE0)
                                            : const Color(0xFF8A8780))),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
              child: AnchorPrimaryButton(
                label: 'Continue',
                icon: Icons.arrow_forward,
                enabled: _selected.isNotEmpty,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Quiz3Screen()));
                },
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
