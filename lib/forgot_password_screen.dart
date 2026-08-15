import 'package:flutter/material.dart';
import 'widgets/anchor_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // ── BACK BUTTON ──
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: Color(0xFF8A8780),
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Back to log in',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          color: Color(0xFF8A8780),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── ICON ──
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0x1AC9A84C),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0x33C9A84C),
                    width: 1,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.lock_outline,
                    color: Color(0xFFC9A84C),
                    size: 26,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── HEADLINE ──
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFEDEAE0),
                    height: 1.1,
                    letterSpacing: -0.5,
                  ),
                  children: [
                    TextSpan(text: 'Reset your\n'),
                    TextSpan(
                      text: 'password.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFC9A84C),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'No problem. Enter your email and we\'ll send you a secure link to set a new one.',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14,
                  color: Color(0xFF8A8780),
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 28),

              // ── STEPS ──
              _buildStep('1', 'Enter the email you signed up with'),
              const SizedBox(height: 8),
              _buildStep('2', 'Check your inbox for a reset link'),
              const SizedBox(height: 8),
              _buildStep('3', 'Set your new password and log back in'),

              const SizedBox(height: 28),

              // ── EMAIL FIELD ──
              _fieldLabel('Email Address'),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C18),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 15,
                    color: Color(0xFFEDEAE0),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'you@email.com',
                    hintStyle: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 15,
                      color: Color(0xFF4A4845),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── SUCCESS MESSAGE ──
              if (_emailSent)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D3D2A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0x4D3D6B4A),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Color(0xFF3D6B4A),
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Reset link sent to ${_emailController.text}. Check your inbox.',
                          style: const TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 13,
                            color: Color(0xFF6AAB7A),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              if (_emailSent) const SizedBox(height: 16),

              // ── CTA BUTTON ──
              AnchorPrimaryButton(
                label: _emailSent ? 'Resend reset link' : 'Send reset link',
                onPressed: () {
                  if (_emailController.text.isNotEmpty) {
                    setState(() => _emailSent = true);
                  }
                },
              ),

              const SizedBox(height: 16),

              // ── BACK TO LOGIN ──
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Remembered it? Log in instead',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 13,
                      color: Color(0xFF4A4845),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String number, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C18),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0x1AC9A84C),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0x33C9A84C),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFC9A84C),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 13,
                color: Color(0xFF8A8780),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 9,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4A4845),
        letterSpacing: 0.7,
      ),
    );
  }
}
