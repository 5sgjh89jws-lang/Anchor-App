import 'checkin/checkin_1_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: _currentIndex == 0
          ? _buildHome()
          : _currentIndex == 1
              ? _buildProgress()
              : _currentIndex == 2
                  ? _buildCommunity()
                  : _buildProfile(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ══════════════════════════════════════
  // HOME TAB
  // ══════════════════════════════════════
  Widget _buildHome() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // ── HEADER ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Good evening, Marcus',
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 13,
                        color: Color(0xFF8A8780))),
                GestureDetector(
                  onTap: () => setState(() => _currentIndex = 3),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: const Color(0xFF1A1C18),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.07))),
                    child: const Icon(Icons.settings_outlined,
                        color: Color(0xFF4A4845), size: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // ── HEADLINE ──
            RichText(
              text: const TextSpan(
                style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFEDEAE0),
                    height: 1.3),
                children: [
                  TextSpan(text: 'Day '),
                  TextSpan(
                      text: '13', style: TextStyle(color: Color(0xFFC9A84C))),
                  TextSpan(text: ' of becoming\nwho you\'re meant to be.'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── STREAK CARD ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1C18),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CURRENT STREAK',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A4845),
                          letterSpacing: 0.7)),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('13',
                          style: TextStyle(
                              fontFamily: 'Fraunces',
                              fontSize: 56,
                              color: Color(0xFFC9A84C),
                              fontWeight: FontWeight.w300,
                              height: 1)),
                      const SizedBox(width: 8),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text('days clean',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 14,
                                  color: Color(0xFF8A8780)))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: 13 / 30,
                      backgroundColor: Colors.white.withValues(alpha: 0.06),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFC9A84C)),
                      minHeight: 4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Day 0',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 9,
                              color: Color(0xFF4A4845))),
                      Text('13 of 30',
                          style: const TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 9,
                              color: Color(0xFFC9A84C))),
                      const Text('Day 30',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 9,
                              color: Color(0xFF4A4845))),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ── IDENTITY CARD ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0x0DC9A84C),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0x33C9A84C)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('YOUR IDENTITY',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC9A84C),
                          letterSpacing: 0.8)),
                  const SizedBox(height: 5),
                  const Text(
                      '"I am becoming someone who chooses presence over escape."',
                      style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFFEDEAE0),
                          height: 1.5)),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── QUICK ACCESS GRID ──
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.6,
              children: [
                _quickCard('🛡️', 'Panic mode', 'Urge tools', () {}),
                _quickCard('📖', 'Education', 'Brain science', () {}),
                _quickCard('👥', 'Community', 'Not alone',
                    () => setState(() => _currentIndex = 2)),
                _quickCard('📊', 'Insights', 'Day 14 unlock',
                    () => setState(() => _currentIndex = 1)),
              ],
            ),

            const SizedBox(height: 14),

            // ── CHECK-IN CTA ──
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Checkin1Screen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFC9A84C),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tonight\'s check-in',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 10,
                                color: const Color(0xFF0A0B09)
                                    .withValues(alpha: 0.6))),
                        const SizedBox(height: 2),
                        const Text('How was your day?',
                            style: TextStyle(
                                fontFamily: 'Fraunces',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0A0B09))),
                      ],
                    ),
                    const Icon(Icons.arrow_forward,
                        color: Color(0xFF0A0B09), size: 20),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  Widget _quickCard(
      String emoji, String title, String sub, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1C18),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 6),
            Text(title,
                style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEDEAE0))),
            Text(sub,
                style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 10,
                    color: Color(0xFF4A4845))),
          ],
        ),
      ),
    );
  }

  // ══════════════════════════════════════
  // PROGRESS TAB
  // ══════════════════════════════════════
  Widget _buildProgress() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFEDEAE0)),
                children: [
                  TextSpan(text: 'Your '),
                  TextSpan(
                      text: 'progress.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFC9A84C))),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Stats row
            Row(
              children: [
                Expanded(child: _statCard('13', 'Streak')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('2', 'Relapses')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('18', 'Clean days')),
              ],
            ),

            const SizedBox(height: 14),

            // Chart card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFF1A1C18),
                  borderRadius: BorderRadius.circular(14),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.07))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Urge strength this week',
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 12,
                              color: Color(0xFF8A8780))),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                              color: const Color(0x1A3D6B4A),
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: const Color(0x333D6B4A))),
                          child: const Text('↓ 38%',
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3D6B4A)))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _bar(0.7),
                      _bar(0.5),
                      _bar(0.85, highlight: true),
                      _bar(0.4),
                      _bar(0.6),
                      _bar(0.35),
                      _bar(0.3),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .map((d) => Expanded(
                            child: Text(d,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 9,
                                    color: Color(0xFF4A4845)))))
                        .toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Insights locked
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0x0DC9A84C),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0x33C9A84C))),
              child: Row(
                children: [
                  const Text('🔒', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 12),
                  const Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Pattern insights unlock at Day 14',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFC9A84C))),
                        SizedBox(height: 3),
                        Text(
                            'Keep checking in daily to unlock your trigger patterns.',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 11,
                                color: Color(0xFF8A8780))),
                      ])),
                ],
              ),
            ),

            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1C18),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07))),
      child: Column(children: [
        Text(value,
            style: const TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 24,
                color: Color(0xFFC9A84C),
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 3),
        Text(label,
            style: const TextStyle(
                fontFamily: 'DM Sans', fontSize: 10, color: Color(0xFF4A4845))),
      ]),
    );
  }

  Widget _bar(double height, {bool highlight = false}) {
    return Expanded(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: height,
          child: Container(
            decoration: BoxDecoration(
              color: highlight
                  ? const Color(0xFFC9A84C)
                  : const Color(0xFFC9A84C).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }

  // ══════════════════════════════════════
  // COMMUNITY TAB
  // ══════════════════════════════════════
  Widget _buildCommunity() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFEDEAE0)),
                    children: [
                      TextSpan(
                          text: 'Community',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC9A84C))),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0x1AC9A84C),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x33C9A84C))),
                  child: const Text('+ Post',
                      style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFC9A84C))),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _postCard(
                    'Day 34',
                    '2h ago',
                    'Hit my first 30 days yesterday. For anyone struggling — it gets easier. The urges don\'t disappear but they lose their power.',
                    47),
                const SizedBox(height: 10),
                _postCard(
                    'Day 7',
                    '4h ago',
                    'Really struggling tonight. About to open panic mode. Just wanted to tell someone. Fighting it right now.',
                    23),
                const SizedBox(height: 10),
                _postCard(
                    'Day 91',
                    '1d ago',
                    '90 days. I genuinely feel like a different person. Focus is back, relationships better. This app changed the game.',
                    128),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postCard(String day, String time, String content, int likes) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1C18),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Anonymous · $day',
                style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    color: Color(0xFF4A4845))),
            Text(time,
                style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    color: Color(0xFF4A4845))),
          ]),
          const SizedBox(height: 8),
          Text(content,
              style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 13,
                  color: Color(0xFF8A8780),
                  height: 1.5)),
          const SizedBox(height: 10),
          Row(children: [
            const Icon(Icons.favorite_border,
                size: 14, color: Color(0xFF4A4845)),
            const SizedBox(width: 4),
            Text('$likes',
                style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 12,
                    color: Color(0xFF4A4845))),
            const Spacer(),
            const Text('✦ Support',
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    color: Color(0xFFC9A84C))),
          ]),
        ],
      ),
    );
  }

  // ══════════════════════════════════════
  // PROFILE TAB
  // ══════════════════════════════════════
  Widget _buildProfile() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0x1AC9A84C),
                  border: Border.all(color: const Color(0x33C9A84C), width: 2)),
              child: const Center(
                  child: Text('⚓', style: TextStyle(fontSize: 24))),
            ),
            const SizedBox(height: 10),
            const Text('Marcus',
                style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    color: Color(0xFFEDEAE0))),
            const Text('Member since Jan 2025',
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    color: Color(0xFF4A4845))),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _statCard('13', 'Streak')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('18', 'Clean days')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('21', 'Longest')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('2', 'Relapses')),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: const Color(0x0DC9A84C),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0x33C9A84C))),
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('YOUR IDENTITY',
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFC9A84C),
                            letterSpacing: 0.8)),
                    SizedBox(height: 5),
                    Text(
                        '"I am becoming someone who chooses presence over escape."',
                        style: TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFFEDEAE0),
                            height: 1.5)),
                  ]),
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF1A1C18),
                  borderRadius: BorderRadius.circular(14),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.07))),
              child: Column(children: [
                _menuRow('Future self letter', badge: 'Day 30'),
                _menuRow('Accountability partner'),
                _menuRow('Manage subscription'),
                _menuRow('Settings', isLast: true),
              ]),
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  Widget _menuRow(String title, {String? badge, bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
          border: Border(
              bottom: isLast
                  ? BorderSide.none
                  : BorderSide(color: Colors.white.withValues(alpha: 0.07)))),
      child: Row(children: [
        Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 14,
                    color: Color(0xFFEDEAE0)))),
        if (badge != null)
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                  color: const Color(0x1AC9A84C),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0x33C9A84C))),
              child: Text(badge,
                  style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFC9A84C))))
        else
          const Icon(Icons.chevron_right, color: Color(0xFF4A4845), size: 18),
      ]),
    );
  }

  // ══════════════════════════════════════
  // BOTTOM NAV
  // ══════════════════════════════════════
  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_outlined, 'activeIcon': Icons.home, 'label': 'Home'},
      {
        'icon': Icons.bar_chart_outlined,
        'activeIcon': Icons.bar_chart,
        'label': 'Progress'
      },
      {
        'icon': Icons.people_outline,
        'activeIcon': Icons.people,
        'label': 'Community'
      },
      {
        'icon': Icons.person_outline,
        'activeIcon': Icons.person,
        'label': 'Profile'
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0B09),
        border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.07))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isActive = _currentIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _currentIndex = index),
              child: Container(
                color: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isActive
                          ? items[index]['activeIcon'] as IconData
                          : items[index]['icon'] as IconData,
                      color: isActive
                          ? const Color(0xFFC9A84C)
                          : const Color(0xFF4A4845),
                      size: 22,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      items[index]['label'] as String,
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontSize: 10,
                        color: isActive
                            ? const Color(0xFFC9A84C)
                            : const Color(0xFF4A4845),
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
