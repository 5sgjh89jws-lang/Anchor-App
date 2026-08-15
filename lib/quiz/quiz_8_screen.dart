import 'package:flutter/material.dart';
import 'quiz_9_screen.dart';

class Quiz8Screen extends StatefulWidget {
  const Quiz8Screen({super.key});
  @override
  State<Quiz8Screen> createState() => _Quiz8ScreenState();
}

class _Quiz8ScreenState extends State<Quiz8Screen> {
  int _selected = -1;
  final List<Map<String, String>> _options = [
    {'emoji': '🏃', 'label': 'Exercise or sport'},
    {'emoji': '🧘', 'label': 'Meditation or prayer'},
    {'emoji': '📚', 'label': 'Reading or learning'},
    {'emoji': '🎮', 'label': 'Gaming or hobbies'},
    {'emoji': '👥', 'label': 'Talking to someone'},
    {'emoji': '🚶', 'label': 'Going outside'},
    {'emoji': '❓', 'label': 'I don\'t have one yet'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressBar(8),
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
                                      color: Color(0xFF8A8780)))
                            ])),
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
                          TextSpan(text: 'Do you have a '),
                          TextSpan(
                              text: 'healthy',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: '\nalternative?'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'What do you replace the urge with? This becomes your go-to swap.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780),
                            height: 1.5)),
                    const SizedBox(height: 24),
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
                                  width: isSelected ? 1.5 : 1)),
                          child: Row(children: [
                            Text(_options[index]['emoji']!,
                                style: const TextStyle(fontSize: 20)),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(_options[index]['label']!,
                                    style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 15,
                                        color: Color(0xFFEDEAE0)))),
                            if (isSelected)
                              Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFC9A84C),
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.check,
                                      color: Color(0xFF0A0B09), size: 12))
                          ]),
                        ),
                      );
                    }),
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
                      onPressed: _selected >= 0
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Quiz9Screen()));
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC9A84C),
                          disabledBackgroundColor:
                              Colors.white.withValues(alpha: 0.08),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 0),
                      child: Text('Continue →',
                          style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: _selected >= 0
                                  ? const Color(0xFF0A0B09)
                                  : const Color(0xFF4A4845))))),
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
            children: List.generate(
                10,
                (index) => Expanded(
                    child: Container(
                        height: 3,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color: index < current
                                ? const Color(0xFFC9A84C)
                                : Colors.white.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(2)))))));
  }
}
