import 'package:flutter/material.dart';

class PaywallFailedScreen extends StatelessWidget {
  const PaywallFailedScreen({super.key});

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
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0x1AC0483C),
                    border: Border.all(color: const Color(0x33C0483C)),
                  ),
                  child: const Center(
                      child: Icon(Icons.warning_amber_rounded,
                          color: Color(0xFFC0483C), size: 32)),
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
                      TextSpan(text: 'Payment '),
                      TextSpan(
                          text: "didn't",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC9A84C))),
                      TextSpan(text: ' go through.'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                    'No worries — this happens sometimes. Please check your payment details and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 14,
                        color: Color(0xFF8A8780),
                        height: 1.6)),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: const Text('Try again',
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A0B09))),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                          color: Colors.white.withValues(alpha: 0.12)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Use a different card',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 15,
                            color: Color(0xFF8A8780))),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Contact support',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 13,
                        color: Color(0xFF4A4845))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
