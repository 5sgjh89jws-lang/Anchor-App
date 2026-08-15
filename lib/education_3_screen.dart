import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'widgets/anchor_button.dart';

class Education3Screen extends StatefulWidget {
  const Education3Screen({super.key});

  @override
  State<Education3Screen> createState() => _Education3ScreenState();
}

class _Education3ScreenState extends State<Education3Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  final List<Map<String, dynamic>> _transformations = [
    {
      'emoji': '🧠',
      'title': 'Your brain rewires back',
      'desc':
          'Dopamine receptors heal. Things that used to feel boring — nature, conversation, real connection — start feeling beautiful again.',
    },
    {
      'emoji': '👀',
      'title': 'You see people differently',
      'desc':
          'Women become people again. Eye contact feels natural. Relationships deepen in ways that felt impossible before.',
    },
    {
      'emoji': '🎯',
      'title': 'Your focus returns',
      'desc':
          'Work gets easier. Goals feel achievable. The mental fog lifts and you start actually becoming the man you\'ve always wanted to be.',
    },
    {
      'emoji': '💪',
      'title': 'Confidence builds',
      'desc':
          'The shame disappears. You walk taller. You stop hiding. The version of you that\'s been waiting behind the habit finally shows up.',
    },
    {
      'emoji': '❤️',
      'title': 'Real intimacy becomes possible',
      'desc':
          'Relationships become deeper, more emotional, more real. You can be present with people you love without distraction.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Column(
            children: [
              _buildProgress(3),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),

                      const Text(
                        'YOUR LIFE AFTER',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC9A84C),
                          letterSpacing: 1.4,
                        ),
                      ),

                      const SizedBox(height: 12),

                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFEDEAE0),
                            height: 1.2,
                            letterSpacing: -0.5,
                          ),
                          children: [
                            TextSpan(text: 'This is who you\'re\n'),
                            TextSpan(
                              text: 'becoming.',
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
                        'When the brain rewires — and it will — this is what life looks like on the other side.',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          color: Color(0xFF8A8780),
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Transformation cards
                      ...List.generate(_transformations.length, (index) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0x0D3D6B4A),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0x1A3D6B4A),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _transformations[index]['emoji'],
                                style: const TextStyle(fontSize: 22),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _transformations[index]['title'],
                                      style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFEDEAE0),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _transformations[index]['desc'],
                                      style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 12,
                                        color: Color(0xFF8A8780),
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      const SizedBox(height: 16),

                      // Final quote
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0x0DC9A84C),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0x33C9A84C),
                          ),
                        ),
                        child: const Text(
                          '"The chains of habit are too light to be felt until they are too heavy to be broken. Start today."\n\n— Warren Buffett',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFFEDEAE0),
                            height: 1.65,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
                child: AnchorPrimaryButton(
                  label: 'I\'m ready. Let\'s start',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignUpScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgress(int current) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 0),
      child: Row(
        children: List.generate(3, (index) {
          return Expanded(
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
          );
        }),
      ),
    );
  }
}
