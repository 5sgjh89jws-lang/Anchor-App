import 'package:flutter/material.dart';
import 'education_2_screen.dart';

class Education1Screen extends StatefulWidget {
  const Education1Screen({super.key});

  @override
  State<Education1Screen> createState() => _Education1ScreenState();
}

class _Education1ScreenState extends State<Education1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  final List<Map<String, dynamic>> _problems = [
    {
      'emoji': '🧠',
      'title': 'Brain rewiring',
      'desc':
          'Porn trains your brain to see the world through a pornographic lens — every interaction, every person becomes a potential scene.',
    },
    {
      'emoji': '👁️',
      'title': 'Objectification',
      'desc':
          'It rewires how you see women — reducing real human beings to objects, making genuine connection feel impossible.',
    },
    {
      'emoji': '🎯',
      'title': 'Destroyed focus',
      'desc':
          'Your dopamine system gets hijacked. Work, study, and real goals feel unbearably boring compared to the constant stimulation.',
    },
    {
      'emoji': '💔',
      'title': 'Relationship damage',
      'desc':
          'Real intimacy suffers. Partners feel inadequate. Emotional connection fades as fantasy replaces reality.',
    },
    {
      'emoji': '😔',
      'title': 'Shame spiral',
      'desc':
          'Every relapse deepens shame. Shame triggers stress. Stress triggers urges. The cycle feeds itself.',
    },
    {
      'emoji': '⚡',
      'title': 'Escalation',
      'desc':
          'The brain demands more extreme content over time just to feel the same effect — a tolerance that never stops growing.',
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
              // ── PROGRESS ──
              _buildProgress(1),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),

                      // Eyebrow
                      const Text(
                        'BEFORE WE CONTINUE',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC9A84C),
                          letterSpacing: 1.4,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Headline
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
                            TextSpan(text: 'This is what porn\nis '),
                            TextSpan(
                              text: 'doing to you.',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFC0483C),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Not to scare you. To make sure you know exactly what you\'re fighting.',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          color: Color(0xFF8A8780),
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Problem cards
                      ...List.generate(_problems.length, (index) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1C18),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.07),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _problems[index]['emoji'],
                                style: const TextStyle(fontSize: 22),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _problems[index]['title'],
                                      style: const TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFEDEAE0),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _problems[index]['desc'],
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

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // ── NEXT BUTTON ──
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Education2Screen(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'I understand — show me the way out →',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A0B09),
                      ),
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
