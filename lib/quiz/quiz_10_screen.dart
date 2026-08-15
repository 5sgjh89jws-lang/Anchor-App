import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../education_1_screen.dart';

class Quiz10Screen extends StatefulWidget {
  const Quiz10Screen({super.key});

  @override
  State<Quiz10Screen> createState() => _Quiz10ScreenState();
}

class _Quiz10ScreenState extends State<Quiz10Screen>
    with TickerProviderStateMixin {
  bool _loading = true;

  late AnimationController _float1;
  late AnimationController _float2;
  late AnimationController _float3;
  late AnimationController _float4;
  late AnimationController _pulseCtrl;
  late AnimationController _sparkleCtrl;
  late AnimationController _progressCtrl;

  late Animation<double> _f1;
  late Animation<double> _f2;
  late Animation<double> _f3;
  late Animation<double> _f4;
  late Animation<double> _pulse;
  late Animation<double> _sparkle;
  late Animation<double> _progress;

  int _completedItems = 0;

  @override
  void initState() {
    super.initState();

    _float1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200))
      ..repeat(reverse: true);
    _float2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1900))
      ..repeat(reverse: true);
    _float3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500))
      ..repeat(reverse: true);
    _float4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
    _pulseCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1600))
      ..repeat(reverse: true);
    _sparkleCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
    _progressCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 9500))
      ..forward();

    _f1 = Tween<double>(begin: -7, end: 7)
        .animate(CurvedAnimation(parent: _float1, curve: Curves.easeInOut));
    _f2 = Tween<double>(begin: 5, end: -5)
        .animate(CurvedAnimation(parent: _float2, curve: Curves.easeInOut));
    _f3 = Tween<double>(begin: -6, end: 6)
        .animate(CurvedAnimation(parent: _float3, curve: Curves.easeInOut));
    _f4 = Tween<double>(begin: 4, end: -4)
        .animate(CurvedAnimation(parent: _float4, curve: Curves.easeInOut));
    _pulse = Tween<double>(begin: 0.93, end: 1.07)
        .animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));
    _sparkle = Tween<double>(begin: 0.15, end: 1.0).animate(
        CurvedAnimation(parent: _sparkleCtrl, curve: Curves.easeInOut));
    _progress = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _progressCtrl, curve: Curves.easeInOut));

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) setState(() => _completedItems = 1);
    });
    Future.delayed(const Duration(milliseconds: 4000), () {
      if (mounted) setState(() => _completedItems = 2);
    });
    Future.delayed(const Duration(milliseconds: 6500), () {
      if (mounted) setState(() => _completedItems = 3);
    });
    Future.delayed(const Duration(milliseconds: 8800), () {
      if (mounted) setState(() => _completedItems = 4);
    });
    Future.delayed(const Duration(milliseconds: 10000), () {
      if (mounted) setState(() => _loading = false);
    });
  }

  @override
  void dispose() {
    _float1.dispose();
    _float2.dispose();
    _float3.dispose();
    _float4.dispose();
    _pulseCtrl.dispose();
    _sparkleCtrl.dispose();
    _progressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loading) return _buildPlanReady(context);
    return _buildLoading();
  }

  Widget _buildLoading() {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text('CRAFTING YOUR PLAN',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFC9A84C),
                      letterSpacing: 1.4)),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEDEAE0),
                      height: 1.25),
                  children: [
                    TextSpan(text: "We're building something\n"),
                    TextSpan(
                        text: 'just for you.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC9A84C))),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── ROW 1: Brain + Calendar ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Brain
                  AnimatedBuilder(
                    animation: _f1,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, _f1.value),
                      child: _doodleBox(
                        size: 70,
                        label: 'Brain rewiring',
                        painter: BrainPainter(),
                      ),
                    ),
                  ),

                  // Calendar
                  AnimatedBuilder(
                    animation: _f2,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, _f2.value),
                      child: _doodleBox(
                        size: 70,
                        label: 'Your streak',
                        painter: CalendarPainter(),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ── CENTER: Anchor ──
              AnimatedBuilder(
                animation: Listenable.merge([_pulse, _f3, _sparkle]),
                builder: (_, __) => Transform.translate(
                  offset: Offset(0, _f3.value * 0.5),
                  child: Transform.scale(
                    scale: _pulse.value,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Sparkle top left
                        Positioned(
                          top: 0,
                          left: 20,
                          child: Opacity(
                            opacity: _sparkle.value,
                            child: const Text('✦',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFFC9A84C))),
                          ),
                        ),
                        // Sparkle bottom right
                        Positioned(
                          bottom: 0,
                          right: 20,
                          child: Opacity(
                            opacity: 1 - _sparkle.value + 0.15,
                            child: const Text('✦',
                                style: TextStyle(
                                    fontSize: 8, color: Color(0xFFC9A84C))),
                          ),
                        ),
                        _doodleBox(
                          size: 80,
                          label: 'Your anchor',
                          painter: AnchorPainter(),
                          highlighted: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── ROW 2: Shield + Focus ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Shield
                  AnimatedBuilder(
                    animation: _f4,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, _f4.value),
                      child: _doodleBox(
                        size: 70,
                        label: 'Protected',
                        painter: ShieldPainter(),
                      ),
                    ),
                  ),

                  // Focus/target
                  AnimatedBuilder(
                    animation: _f1,
                    builder: (_, __) => Transform.translate(
                      offset: Offset(0, -_f1.value * 0.7),
                      child: _doodleBox(
                        size: 70,
                        label: 'Focus restored',
                        painter: TargetPainter(),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Progress bar
              AnimatedBuilder(
                animation: _progress,
                builder: (_, __) => Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: _progress.value,
                        backgroundColor: Colors.white.withValues(alpha: 0.06),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFC9A84C)),
                        minHeight: 3,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${(_progress.value * 100).toInt()}% complete',
                      style: const TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 10,
                          color: Color(0xFFC9A84C)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Loading items
              _loadingItem('Trigger patterns identified', _completedItems >= 1,
                  _completedItems == 0),
              const SizedBox(height: 7),
              _loadingItem('Danger window mapped', _completedItems >= 2,
                  _completedItems == 1),
              const SizedBox(height: 7),
              _loadingItem('Building your personalised plan...',
                  _completedItems >= 3, _completedItems == 2),
              const SizedBox(height: 7),
              _loadingItem('Your toolkit ready', _completedItems >= 4,
                  _completedItems == 3),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _doodleBox(
      {required double size,
      required String label,
      required CustomPainter painter,
      bool highlighted = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                highlighted ? const Color(0x1AC9A84C) : const Color(0xFF1A1C18),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: highlighted
                  ? const Color(0x40C9A84C)
                  : const Color(0x15C9A84C),
              width: highlighted ? 1.5 : 1,
            ),
          ),
          child: CustomPaint(
            size: Size(size - 24, size - 24),
            painter: painter,
          ),
        ),
        const SizedBox(height: 5),
        Text(label,
            style: const TextStyle(
                fontFamily: 'DM Sans', fontSize: 9, color: Color(0xFF8A8780))),
      ],
    );
  }

  Widget _loadingItem(String text, bool done, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: active
              ? const Color(0x33C9A84C)
              : Colors.white.withValues(alpha: 0.07),
          width: active ? 1 : 0.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 12,
                color: active
                    ? const Color(0xFFC9A84C)
                    : done
                        ? const Color(0xFF8A8780)
                        : const Color(0xFF4A4845),
              ),
            ),
          ),
          if (done)
            Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    color: Color(0xFF3D6B4A), shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 12))
          else if (active)
            const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Color(0xFFC9A84C)))
          else
            Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15)))),
        ],
      ),
    );
  }

  Widget _buildPlanReady(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B09),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text('YOUR PERSONALISED PLAN',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFC9A84C),
                      letterSpacing: 1.4)),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEDEAE0),
                      height: 1.15),
                  children: [
                    TextSpan(text: 'Your plan is '),
                    TextSpan(
                        text: 'ready.',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFC9A84C))),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                  'Based on your answers, we\'ve built a recovery plan matched to your patterns.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 14,
                      color: Color(0xFF8A8780),
                      height: 1.6)),
              const SizedBox(height: 28),
              _planItem('Primary Trigger', 'Stress', const Color(0xFFC9A84C)),
              const SizedBox(height: 10),
              _planItem(
                  'Danger Window', 'Late at night', const Color(0xFFC0483C)),
              const SizedBox(height: 10),
              _planItem('First Goal', '30 days', const Color(0xFF3D6B4A)),
              const SizedBox(height: 10),
              _planItem('Recovery Type', 'Customised', const Color(0xFF3A6A9A)),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Education1Screen())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC9A84C),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 0),
                  child: const Text('Unlock my plan →',
                      style: TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A0B09))),
                ),
              ),
              const SizedBox(height: 12),
              const Text('7-day free trial · No charge today',
                  style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      color: Color(0xFF4A4845))),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _planItem(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
          color: const Color(0xFF1A1C18),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07))),
      child: Row(
        children: [
          Expanded(
              child: Text(label,
                  style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                      color: Color(0xFF4A4845),
                      fontWeight: FontWeight.w600))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: color.withValues(alpha: 0.3))),
            child: Text(value,
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: color)),
          ),
        ],
      ),
    );
  }
}

// ── BRAIN PAINTER — fully drawn ──
class BrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFC9A84C)
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Left hemisphere
    final left = Path();
    left.moveTo(cx, cy - 16);
    left.cubicTo(cx - 6, cy - 20, cx - 18, cy - 18, cx - 20, cy - 8);
    left.cubicTo(cx - 24, cy, cx - 20, cy + 8, cx - 16, cy + 12);
    left.cubicTo(cx - 12, cy + 18, cx - 6, cy + 18, cx, cy + 14);
    canvas.drawPath(left, p);

    // Right hemisphere
    final right = Path();
    right.moveTo(cx, cy - 16);
    right.cubicTo(cx + 6, cy - 20, cx + 18, cy - 18, cx + 20, cy - 8);
    right.cubicTo(cx + 24, cy, cx + 20, cy + 8, cx + 16, cy + 12);
    right.cubicTo(cx + 12, cy + 18, cx + 6, cy + 18, cx, cy + 14);
    canvas.drawPath(right, p);

    // Center divider dashed
    final dash = Paint()
      ..color = const Color(0xFFC9A84C).withOpacity(0.4)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (double y = cy - 14; y < cy + 12; y += 5) {
      canvas.drawLine(
          Offset(cx, y), Offset(cx, math.min(y + 3, cy + 12)), dash);
    }

    // Left hemisphere wrinkles
    final wrinkle = Paint()
      ..color = const Color(0xFFC9A84C).withOpacity(0.5)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final w1 = Path();
    w1.moveTo(cx - 16, cy - 6);
    w1.cubicTo(cx - 12, cy - 10, cx - 8, cy - 4, cx - 4, cy - 6);
    canvas.drawPath(w1, wrinkle);
    final w2 = Path();
    w2.moveTo(cx - 18, cy + 4);
    w2.cubicTo(cx - 13, cy, cx - 9, cy + 6, cx - 5, cy + 2);
    canvas.drawPath(w2, wrinkle);

    // Right hemisphere wrinkles
    final w3 = Path();
    w3.moveTo(cx + 16, cy - 6);
    w3.cubicTo(cx + 12, cy - 10, cx + 8, cy - 4, cx + 4, cy - 6);
    canvas.drawPath(w3, wrinkle);
    final w4 = Path();
    w4.moveTo(cx + 18, cy + 4);
    w4.cubicTo(cx + 13, cy, cx + 9, cy + 6, cx + 5, cy + 2);
    canvas.drawPath(w4, wrinkle);

    // Stem/brainstem
    final stem = Path();
    stem.moveTo(cx - 4, cy + 14);
    stem.quadraticBezierTo(cx, cy + 20, cx + 4, cy + 14);
    canvas.drawPath(stem, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── ANCHOR PAINTER ──
class AnchorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFC9A84C)
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    final cx = size.width / 2;
    final cy = size.height / 2;
    canvas.drawCircle(Offset(cx, cy - 14), 9, p);
    canvas.drawLine(Offset(cx, cy - 5), Offset(cx, cy + 12), p);
    canvas.drawLine(Offset(cx - 14, cy + 4), Offset(cx + 14, cy + 4), p);
    final curve = Path();
    curve.moveTo(cx - 14, cy + 4);
    curve.quadraticBezierTo(cx - 14, cy + 18, cx, cy + 18);
    curve.quadraticBezierTo(cx + 14, cy + 18, cx + 14, cy + 4);
    canvas.drawPath(curve, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── SHIELD PAINTER ──
class ShieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFC9A84C)
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;
    final cx = size.width / 2;
    final shield = Path();
    shield.moveTo(cx, 2);
    shield.lineTo(cx + 18, 9);
    shield.lineTo(cx + 18, 26);
    shield.quadraticBezierTo(cx + 18, 40, cx, 44);
    shield.quadraticBezierTo(cx - 18, 40, cx - 18, 26);
    shield.lineTo(cx - 18, 9);
    shield.close();
    final fill = Paint()
      ..color = const Color(0xFFC9A84C).withOpacity(0.08)
      ..style = PaintingStyle.fill;
    canvas.drawPath(shield, fill);
    canvas.drawPath(shield, p);
    final check = Path();
    check.moveTo(cx - 8, 24);
    check.lineTo(cx - 2, 30);
    check.lineTo(cx + 10, 18);
    canvas.drawPath(
        check,
        Paint()
          ..color = const Color(0xFFC9A84C)
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── CALENDAR PAINTER ──
class CalendarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFC9A84C)
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final rrect = RRect.fromRectAndRadius(
        const Rect.fromLTWH(2, 6, 42, 38), const Radius.circular(6));
    final hdr = Paint()
      ..color = const Color(0xFFC9A84C).withOpacity(0.12)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            const Rect.fromLTWH(2, 6, 42, 12), const Radius.circular(6)),
        hdr);
    canvas.drawRRect(rrect, p);
    canvas.drawLine(const Offset(2, 18), const Offset(44, 18), p);
    canvas.drawLine(const Offset(12, 6), const Offset(12, 2), p);
    canvas.drawLine(const Offset(34, 6), const Offset(34, 2), p);
    final dot = Paint()..style = PaintingStyle.fill;
    final positions = [
      [10.0, 26.0, false],
      [23.0, 26.0, false],
      [36.0, 26.0, true],
      [10.0, 36.0, true],
      [23.0, 36.0, true],
      [36.0, 36.0, false]
    ];
    for (final d in positions) {
      dot.color = (d[2] as bool)
          ? const Color(0xFF3D6B4A)
          : const Color(0xFFC9A84C).withOpacity(0.3);
      canvas.drawCircle(Offset(d[0] as double, d[1] as double), 2.5, dot);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── TARGET/FOCUS PAINTER ──
class TargetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = const Color(0xFFC9A84C)
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;
    final cx = size.width / 2;
    final cy = size.height / 2;
    canvas.drawCircle(Offset(cx, cy), 20, p);
    canvas.drawCircle(Offset(cx, cy), 13, p);
    canvas.drawCircle(Offset(cx, cy), 6, p);
    final dot = Paint()
      ..color = const Color(0xFFC9A84C)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, cy), 2.5, dot);
    final cross = Paint()
      ..color = const Color(0xFFC9A84C).withOpacity(0.35)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(cx, cy - 22), Offset(cx, cy + 22), cross);
    canvas.drawLine(Offset(cx - 22, cy), Offset(cx + 22, cy), cross);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
