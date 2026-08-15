import 'package:flutter/material.dart';
import 'checkin_3_screen.dart';

class Checkin2Screen extends StatefulWidget {
  final int urgeValue;
  const Checkin2Screen({super.key, required this.urgeValue});

  @override
  State<Checkin2Screen> createState() => _Checkin2ScreenState();
}

class _Checkin2ScreenState extends State<Checkin2Screen> {
  final List<String> _selected = [];

  final List<String> _triggers = [
    'Boredom',
    'Stress',
    'Loneliness',
    'Late at night',
    'Anxiety',
    'Home alone',
    'Social media',
    'Tired',
    'Procrastinating',
    'After argument',
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
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child:
                          const Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(Icons.chevron_left,
                            color: Color(0xFF8A8780), size: 20),
                        SizedBox(width: 4),
                        Text('Back',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 14,
                                color: Color(0xFF8A8780))),
                      ]),
                    ),
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
                          TextSpan(text: 'What '),
                          TextSpan(
                              text: 'triggered',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' your urges?'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                        'Select all that apply. Builds your pattern insights.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780))),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _triggers.map((trigger) {
                        final isSelected = _selected.contains(trigger);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected)
                                _selected.remove(trigger);
                              else
                                _selected.add(trigger);
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
                                  width: isSelected ? 1.5 : 1),
                            ),
                            child: Text(trigger,
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 13,
                                    color: isSelected
                                        ? const Color(0xFFEDEAE0)
                                        : const Color(0xFF8A8780))),
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
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Checkin3Screen(
                              urgeValue: widget.urgeValue,
                              triggers: _selected))),
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
                          borderRadius: BorderRadius.circular(2)))))),
    );
  }
}
