import 'package:flutter/material.dart';
import 'checkin_2_screen.dart';

class Checkin1Screen extends StatefulWidget {
  const Checkin1Screen({super.key});

  @override
  State<Checkin1Screen> createState() => _Checkin1ScreenState();
}

class _Checkin1ScreenState extends State<Checkin1Screen> {
  double _urgeValue = 4;

  String get _urgeDescription {
    if (_urgeValue <= 1) return 'Barely a whisper';
    if (_urgeValue <= 2) return 'Mild, you noticed it';
    if (_urgeValue <= 3) return 'Present but manageable';
    if (_urgeValue <= 4) return 'Manageable — you handled it.';
    if (_urgeValue <= 5) return 'Noticeable, took effort';
    if (_urgeValue <= 6) return 'Strong, required focus';
    if (_urgeValue <= 7) return 'Very strong urge';
    if (_urgeValue <= 8) return 'Intense — hard to ignore';
    if (_urgeValue <= 9) return 'Nearly overwhelming';
    return 'All-consuming urge';
  }

  Color get _urgeColor {
    if (_urgeValue <= 2) return const Color(0xFF4a7c59);
    if (_urgeValue <= 4) return const Color(0xFF8a9c5a);
    if (_urgeValue <= 6) return const Color(0xFFC9A84C);
    if (_urgeValue <= 8) return const Color(0xFFc09040);
    return const Color(0xFFb45046);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar
            _buildProgressBar(1),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Back
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
                          TextSpan(text: 'How strong were your\n'),
                          TextSpan(
                              text: 'urges',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' today?'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text('Be honest — this is for you, not anyone else.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780))),

                    const Spacer(),

                    // Big number
                    Center(
                      child: Text(
                        _urgeValue.toInt().toString(),
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 72,
                            fontWeight: FontWeight.w300,
                            color: _urgeColor,
                            height: 1),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: Text(
                        _urgeDescription,
                        style: const TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF8A8780)),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFFC9A84C),
                        inactiveTrackColor:
                            Colors.white.withValues(alpha: 0.08),
                        thumbColor: const Color(0xFFC9A84C),
                        overlayColor:
                            const Color(0xFFC9A84C).withValues(alpha: 0.2),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 12),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: _urgeValue,
                        min: 1,
                        max: 10,
                        divisions: 9,
                        onChanged: (value) =>
                            setState(() => _urgeValue = value),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Barely there',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 10,
                                color: Color(0xFF4A4845))),
                        Text('Overwhelming',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 10,
                                color: Color(0xFF4A4845))),
                      ],
                    ),

                    const Spacer(),
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
                          builder: (_) =>
                              Checkin2Screen(urgeValue: _urgeValue.toInt()))),
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
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                )),
      ),
    );
  }
}
