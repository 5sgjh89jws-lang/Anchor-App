import 'package:flutter/material.dart';
import 'onboarding_7_screen.dart';

class Onboarding6Screen extends StatefulWidget {
  const Onboarding6Screen({super.key});

  @override
  State<Onboarding6Screen> createState() => _Onboarding6ScreenState();
}

class _Onboarding6ScreenState extends State<Onboarding6Screen> {
  int _selected = 1;

  final List<Map<String, String>> _times = [
    {'emoji': '🕗', 'label': '8:00 PM'},
    {'emoji': '🕘', 'label': '9:00 PM'},
    {'emoji': '🕙', 'label': '10:30 PM'},
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
                    const Text('DAILY REMINDER',
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
                          TextSpan(text: 'When should we '),
                          TextSpan(
                              text: 'remind',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' you?'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'We\'ll send your daily check-in reminder at this time every evening.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780),
                            height: 1.5)),
                    const SizedBox(height: 24),

                    // Notification preview
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: const Color(0xFF1A1C18),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07))),
                      child: Row(
                        children: [
                          Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                  color: const Color(0x1AC9A84C),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0x33C9A84C))),
                              child: const Center(
                                  child: Text('⚓',
                                      style: TextStyle(fontSize: 16)))),
                          const SizedBox(width: 12),
                          const Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text('Anchor',
                                    style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFEDEAE0))),
                                Text(
                                    'Time for tonight\'s check-in. How was your day?',
                                    style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 11,
                                        color: Color(0xFF8A8780))),
                              ])),
                          const Text('now',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 10,
                                  color: Color(0xFF4A4845))),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    ...List.generate(_times.length, (index) {
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
                            Text(_times[index]['emoji']!,
                                style: const TextStyle(fontSize: 20)),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(_times[index]['label']!,
                                    style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 15,
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
                    const Center(
                        child: Text('I\'ll set this later',
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
                      MaterialPageRoute(builder: (_) => Onboarding7Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('Set my reminder →',
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
