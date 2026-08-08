import 'package:flutter/material.dart';
import 'success_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;
  int _passwordStrength = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength(String value) {
    int strength = 0;
    if (value.length >= 8) strength++;
    if (value.contains(RegExp(r'[A-Z]'))) strength++;
    if (value.contains(RegExp(r'[0-9]'))) strength++;
    if (value.contains(RegExp(r'[!@#\$%^&*]'))) strength++;
    setState(() => _passwordStrength = strength);
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
                        'Back',
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

              const SizedBox(height: 8),

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
                    TextSpan(text: 'Create your\n'),
                    TextSpan(
                      text: 'account.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFC9A84C),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Private, anonymous, and secure.',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14,
                  color: Color(0xFF8A8780),
                ),
              ),

              const SizedBox(height: 28),

              // ── GOOGLE BUTTON ──
              _socialButton(
                icon: Icons.g_mobiledata,
                label: 'Continue with Google',
              ),

              const SizedBox(height: 10),

              // ── APPLE BUTTON ──
              _socialButton(
                icon: Icons.apple,
                label: 'Continue with Apple',
              ),

              const SizedBox(height: 24),

              // ── DIVIDER ──
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.07),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or use email',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 12,
                        color: Color(0xFF4A4845),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.07),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── FULL NAME ──
              _fieldLabel('Full Name'),
              const SizedBox(height: 6),
              _inputField(
                controller: _nameController,
                hint: 'Marcus Reid',
                keyboardType: TextInputType.name,
              ),

              const SizedBox(height: 14),

              // ── EMAIL ──
              _fieldLabel('Email Address'),
              const SizedBox(height: 6),
              _inputField(
                controller: _emailController,
                hint: 'you@email.com',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 14),

              // ── PASSWORD ──
              _fieldLabel('Password'),
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
                  controller: _passwordController,
                  obscureText: !_passwordVisible,
                  onChanged: _checkPasswordStrength,
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 15,
                    color: Color(0xFFEDEAE0),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Min. 8 characters',
                    hintStyle: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 15,
                      color: Color(0xFF4A4845),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF4A4845),
                        size: 18,
                      ),
                      onPressed: () {
                        setState(
                          () => _passwordVisible = !_passwordVisible,
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // ── PASSWORD STRENGTH BARS ──
              Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      height: 3,
                      decoration: BoxDecoration(
                        color: index < _passwordStrength
                            ? const Color(0xFFC9A84C)
                            : Colors.white.withValues(alpha: 0.07),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // ── TERMS ──
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 12,
                    color: Color(0xFF4A4845),
                    height: 1.6,
                  ),
                  children: [
                    TextSpan(text: 'By continuing you agree to our '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(color: Color(0xFF8A8780)),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Color(0xFF8A8780)),
                    ),
                    TextSpan(
                      text: '. Your data is encrypted and never sold.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── CTA BUTTON — navigates to Success ──
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SuccessScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC9A84C),
                    foregroundColor: const Color(0xFF0A0B09),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Create my account',
                    style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0A0B09),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ── SWITCH TO LOGIN ──
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 14,
                      color: Color(0xFF8A8780),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 14,
                        color: Color(0xFFC9A84C),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFC9A84C),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFFEDEAE0), size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFFEDEAE0),
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

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 15,
          color: Color(0xFFEDEAE0),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 15,
            color: Color(0xFF4A4845),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}