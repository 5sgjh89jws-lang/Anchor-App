import 'package:flutter/material.dart';
import 'checkin_4_screen.dart';

class Checkin3Screen extends StatefulWidget {
  final int urgeValue;
  final List<String> triggers;
  const Checkin3Screen(
      {super.key, required this.urgeValue, required this.triggers});

  @override
  State<Checkin3Screen> createState() => _Checkin3ScreenState();
}

class _Checkin3ScreenState extends State<Checkin3Screen> {
  int _selected = 0;

  final List<Map<String, String>> _swaps = [
    {'emoji': '🏃', 'label': 'Exercised'},
    {'emoji': '🧊', 'label': 'Cold shower'},
    {'emoji': '📞', 'label': 'Called someone'},
    {'emoji': '🚶', 'label': 'Went outside'},
    {'emoji': '🙏', 'label': 'Meditated / Prayed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressBar(3),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
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
                    const Text('TONIGHT\'S CHECK-IN',
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
                          TextSpan(text: 'Did you '),
                          TextSpan(
                              text: 'swap',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' the dopamine?'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('What did you choose instead?',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780))),
                    const SizedBox(height: 24),
                    ...List.generate(_swaps.length, (index) {
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
                                  ? const Color(0x1A3D6B4A)
                                  : const Color(0xFF1A1C18),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: isSelected
                                      ? const Color(0x333D6B4A)
                                      : Colors.white.withValues(alpha: 0.07),
                                  width: isSelected ? 1.5 : 1)),
                          child: Row(children: [
                            Text(_swaps[index]['emoji']!,
                                style: const TextStyle(fontSize: 20)),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Text(_swaps[index]['label']!,
                                    style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 14,
                                        color: Color(0xFFEDEAE0)))),
                            if (isSelected)
                              Container(
                                  width: 18,
                                  height: 18,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF3D6B4A),
                                      shape: BoxShape.circle),
                                  child: const Icon(Icons.check,
                                      color: Colors.white, size: 11)),
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Checkin4Screen(
                              urgeValue: widget.urgeValue,
                              triggers: widget.triggers,
                              swap: _swaps[_selected]['label']!))),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('Continue →',
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

  Widget _buildProgressBar(int current) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 28, 0),
        child: Row(
            children: List.generate(
                4,
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
