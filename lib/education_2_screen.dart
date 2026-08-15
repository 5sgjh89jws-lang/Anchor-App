import 'package:flutter/material.dart';
import 'education_3_screen.dart';
import 'widgets/anchor_button.dart';

class Education2Screen extends StatefulWidget {
  const Education2Screen({super.key});

  @override
  State<Education2Screen> createState() => _Education2ScreenState();
}

class _Education2ScreenState extends State<Education2Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

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
              _buildProgress(2),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),

                      const Text(
                        'THE TURNING POINT',
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
                            TextSpan(text: 'You\'re already\n'),
                            TextSpan(
                              text: '50% there.',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFC9A84C),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Kidlin's Law card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0x0DC9A84C),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0x33C9A84C),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'KIDLIN\'S LAW',
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFC9A84C),
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '"If you can write the problem down clearly, you are halfway to solving it."',
                              style: TextStyle(
                                fontFamily: 'Fraunces',
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFFEDEAE0),
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '— Frederick W. Kidlin',
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 12,
                                color: Color(0xFFC9A84C),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'You\'ve done exactly that.',
                        style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEDEAE0),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'By answering those questions honestly — about your triggers, your patterns, how long this has been going on — you\'ve named the problem clearly. That\'s not a small thing.',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          color: Color(0xFF8A8780),
                          height: 1.65,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 50% visual
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C18),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.07),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Problem identified',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12,
                                    color: Color(0xFF8A8780),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0x1A3D6B4A),
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: const Color(0x333D6B4A),
                                    ),
                                  ),
                                  child: const Text(
                                    '✓ Done',
                                    style: TextStyle(
                                      fontFamily: 'DM Sans',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3D6B4A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: 0.5,
                                backgroundColor:
                                    Colors.white.withValues(alpha: 0.06),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFFC9A84C),
                                ),
                                minHeight: 6,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Start',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 9,
                                    color: Color(0xFF4A4845),
                                  ),
                                ),
                                const Text(
                                  '50% — You are here',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 9,
                                    color: Color(0xFFC9A84C),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  'Free',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 9,
                                    color: Color(0xFF4A4845),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Most people never get this far. They feel the shame, close the tab, and pretend it isn\'t happening. You didn\'t do that. You\'re here.',
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 14,
                          color: Color(0xFF8A8780),
                          height: 1.65,
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
                  label: 'Show me what\'s possible',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Education3Screen(),
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
