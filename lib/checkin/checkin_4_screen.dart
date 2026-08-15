import 'package:flutter/material.dart';
import 'checkin_5_screen.dart';
import 'checkin_6_screen.dart';

class Checkin4Screen extends StatelessWidget {
  final int urgeValue;
  final List<String> triggers;
  final String swap;

  const Checkin4Screen({
    super.key,
    required this.urgeValue,
    required this.triggers,
    required this.swap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Column(
          children: [
            _buildProgressBar(4),
            Expanded(
              child: Padding(
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
                          TextSpan(text: 'Did you stay '),
                          TextSpan(
                              text: 'clean',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFC9A84C))),
                          TextSpan(text: ' today?'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('One honest answer. No judgment here.',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780))),
                    const SizedBox(height: 32),

                    // YES card
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Checkin5Screen())),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0x1A3D6B4A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0x253D6B4A)),
                        ),
                        child: const Column(
                          children: [
                            Text('✦',
                                style: TextStyle(
                                    fontSize: 28, color: Color(0xFFC9A84C))),
                            SizedBox(height: 8),
                            Text('Yes — I stayed clean',
                                style: TextStyle(
                                    fontFamily: 'Fraunces',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEDEAE0))),
                            SizedBox(height: 4),
                            Text('Streak continues',
                                style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12,
                                    color: Color(0xFF8A8780))),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // NO card
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Checkin6Screen())),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07)),
                        ),
                        child: const Center(
                          child: Text('No — I relapsed today',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 14,
                                  color: Color(0xFF8A8780))),
                        ),
                      ),
                    ),
                  ],
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
                            color: const Color(0xFFC9A84C),
                            borderRadius: BorderRadius.circular(2)))))));
  }
}
