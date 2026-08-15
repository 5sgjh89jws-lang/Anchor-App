import 'package:flutter/material.dart';
import 'onboarding_5_screen.dart';

class Onboarding4Screen extends StatefulWidget {
  const Onboarding4Screen({super.key});

  @override
  State<Onboarding4Screen> createState() => _Onboarding4ScreenState();
}

class _Onboarding4ScreenState extends State<Onboarding4Screen> {
  int _selected = 0;
  final _controller = TextEditingController();
  bool _showCustom = false;

  final List<Map<String, String>> _options = [
    {'emoji': '💪', 'label': 'To become the man I know I can be'},
    {'emoji': '❤️', 'label': 'For my relationship or future partner'},
    {'emoji': '🧠', 'label': 'To regain mental clarity and focus'},
    {'emoji': '🌟', 'label': 'To build real confidence and self-respect'},
    {'emoji': '🙏', 'label': 'For my faith and personal values'},
  ];

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
                    const Center(
                        child: Text('⚓', style: TextStyle(fontSize: 40))),
                    const SizedBox(height: 20),
                    const Text('YOUR ANCHOR',
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
                          TextSpan(text: 'What\'s your '),
                          TextSpan(
                              text: 'anchor?',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'The reason you return to when urges hit. This appears on your home screen.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780),
                            height: 1.5)),
                    const SizedBox(height: 24),
                    if (!_showCustom) ...[
                      ...List.generate(_options.length, (index) {
                        final isSelected = _selected == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selected = index),
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
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
                                  style: const TextStyle(fontSize: 18)),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(_options[index]['label']!,
                                      style: const TextStyle(
                                          fontFamily: 'DM Sans',
                                          fontSize: 14,
                                          color: Color(0xFFEDEAE0)))),
                              if (isSelected)
                                Container(
                                    width: 18,
                                    height: 18,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFC9A84C),
                                        shape: BoxShape.circle),
                                    child: const Icon(Icons.check,
                                        color: Color(0xFF0A0B09), size: 11)),
                            ]),
                          ),
                        );
                      }),
                      const SizedBox(height: 8),
                      Center(
                        child: GestureDetector(
                          onTap: () => setState(() => _showCustom = true),
                          child: const Text('Or write your own...',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 13,
                                  color: Color(0xFF4A4845),
                                  decoration: TextDecoration.underline)),
                        ),
                      ),
                    ] else ...[
                      const Text('Write your anchor:',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 13,
                              color: Color(0xFF8A8780))),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF1A1C18),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0x33C9A84C))),
                        child: TextField(
                          controller: _controller,
                          maxLines: 3,
                          style: const TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFFEDEAE0)),
                          decoration: const InputDecoration(
                              hintText: 'I am quitting because...',
                              hintStyle: TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF4A4845)),
                              contentPadding: EdgeInsets.all(14),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => setState(() => _showCustom = false),
                        child: const Text('← Back to options',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 13,
                                color: Color(0xFF4A4845))),
                      ),
                    ],
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
                      MaterialPageRoute(builder: (_) => Onboarding5Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('This is my anchor →',
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
