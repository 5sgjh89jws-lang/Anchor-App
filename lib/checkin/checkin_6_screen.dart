import 'package:flutter/material.dart';
import '../home_screen.dart';

class Checkin6Screen extends StatelessWidget {
  const Checkin6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Moon circle
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0x1AC0483C),
                      border: Border.all(color: const Color(0x33C0483C))),
                  child: const Center(
                      child: Text('🌑', style: TextStyle(fontSize: 28))),
                ),

                const SizedBox(height: 24),

                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFEDEAE0),
                        height: 1.15),
                    children: [
                      TextSpan(text: 'Thank you for\nbeing '),
                      TextSpan(
                          text: 'honest.',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC9A84C))),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  'That took courage. Honesty is the first act of the person you\'re becoming. Tonight doesn\'t define you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 13,
                      color: Color(0xFF8A8780),
                      height: 1.65),
                ),

                const SizedBox(height: 16),

                Container(
                    width: 32,
                    height: 1,
                    color: Colors.white.withValues(alpha: 0.08)),

                const SizedBox(height: 16),

                const Text('YOUR LONGEST STREAK',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A4845),
                        letterSpacing: 0.8)),
                const SizedBox(height: 6),
                const Text('13',
                    style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 52,
                        color: Color(0xFFEDEAE0),
                        fontWeight: FontWeight.w300,
                        height: 1)),
                const SizedBox(height: 4),
                const Text('days — you\'ll do it again',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 12,
                        color: Color(0xFF8A8780))),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC9A84C),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 0),
                    child: const Text('Begin again. Day 1 starts now.',
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A0B09))),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(
                            color: Colors.white.withValues(alpha: 0.12)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text('I need help right now',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 14,
                            color: Color(0xFF8A8780))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
