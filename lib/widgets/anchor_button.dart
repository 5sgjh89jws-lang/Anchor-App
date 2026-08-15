import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Primary pill-shaped button with a gold rim-light border and soft
/// outer glow, matching the Anchor design system. Used for Continue,
/// Create my account, and other primary CTAs in Section 1.
///
/// IMPORTANT: the gold border is drawn on a plain, never-animated
/// Container. Flutter's AnimatedContainer cannot interpolate a custom
/// BoxBorder subclass (it only knows how to animate its own built-in
/// Border / BorderDirectional types) and crashes if you try. So only
/// the glow (boxShadow) animates here — the border itself never does.
class AnchorPrimaryButton extends StatefulWidget {
  const AnchorPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = true,
    this.enabled = true,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool expand;
  final bool enabled;

  @override
  State<AnchorPrimaryButton> createState() => _AnchorPrimaryButtonState();
}

class _AnchorPrimaryButtonState extends State<AnchorPrimaryButton> {
  bool _pressed = false;

  static const _gold = Color(0xFFC9A84C);
  static const _goldLight = Color(0xFFF0D488);
  static const _goldDark = Color(0xFF8A6A2E);
  static const _fill = Color(0xFF12130F);
  static const _text = Color(0xFFEDEAE0);
  static const _disabledText = Color(0xFF4A4845);
  static const _disabledBorder = Color(0xFF3A3A34);

  void _onTapDown(TapDownDetails d) {
    if (!widget.enabled) return;
    setState(() => _pressed = true);
    // Real native Taptic Engine feedback — no audio file involved.
    HapticFeedback.mediumImpact();
  }

  void _onTapUp(TapUpDetails d) {
    if (!widget.enabled) return;
    setState(() => _pressed = false);
    widget.onPressed();
  }

  void _onTapCancel() {
    if (!widget.enabled) return;
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        // This outer AnimatedContainer only ever animates boxShadow.
        // No border here on purpose — see class doc comment above.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: !widget.enabled
                ? []
                : _pressed
                    ? [
                        BoxShadow(
                          color: _gold.withValues(alpha: 0.35),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: _gold.withValues(alpha: 0.25),
                          blurRadius: 24,
                          spreadRadius: 4,
                        ),
                        BoxShadow(
                          color: _gold.withValues(alpha: 0.12),
                          blurRadius: 60,
                          spreadRadius: 10,
                        ),
                      ],
          ),
          // This inner Container's decoration (including the gradient
          // border) is never animated — it's just painted fresh on
          // every build, so Flutter never tries to interpolate it.
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 24),
            decoration: BoxDecoration(
              color: _fill,
              borderRadius: BorderRadius.circular(100),
              border: widget.enabled
                  ? GradientBoxBorder(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [_goldLight, _gold, _goldDark],
                        stops: [0.0, 0.45, 1.0],
                      ),
                      width: 1.5,
                    )
                  : Border.all(color: _disabledBorder, width: 1.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  child: Text(
                    widget.label.toUpperCase(),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 1.5,
                      color: widget.enabled ? _text : _disabledText,
                    ),
                  ),
                ),
                if (widget.icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    widget.icon,
                    size: 16,
                    color: widget.enabled ? _text : _disabledText,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );

    return widget.expand
        ? SizedBox(width: double.infinity, child: content)
        : content;
  }
}

/// Secondary pill button with a deep violet rim-light border and soft
/// purple glow — used for Sign in and other lower-emphasis actions
/// that sit alongside the gold primary button.
///
/// Same safe pattern as AnchorPrimaryButton: the gradient border lives
/// on a plain, never-animated Container, and only the glow (boxShadow)
/// animates. See AnchorPrimaryButton's doc comment for why.
class AnchorGhostButton extends StatefulWidget {
  const AnchorGhostButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.expand = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool expand;

  @override
  State<AnchorGhostButton> createState() => _AnchorGhostButtonState();
}

class _AnchorGhostButtonState extends State<AnchorGhostButton> {
  bool _pressed = false;

  static const _purpleLight = Color(0xFFB9A0F0);
  static const _purple = Color(0xFF7C5CD4);
  static const _purpleDark = Color(0xFF4A2E8C);
  static const _fill = Color(0xFF12130F);
  static const _text = Color(0xFFEDEAE0);

  void _onTapDown(TapDownDetails d) {
    setState(() => _pressed = true);
    HapticFeedback.mediumImpact();
  }

  void _onTapUp(TapUpDetails d) {
    setState(() => _pressed = false);
    widget.onPressed();
  }

  void _onTapCancel() {
    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final content = GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
        // Outer AnimatedContainer only ever animates boxShadow — no
        // border here, same reasoning as the primary button.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 90),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: _pressed
                ? [
                    BoxShadow(
                      color: _purple.withValues(alpha: 0.35),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: _purple.withValues(alpha: 0.25),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                    BoxShadow(
                      color: _purple.withValues(alpha: 0.1),
                      blurRadius: 50,
                      spreadRadius: 8,
                    ),
                  ],
          ),
          // Inner Container's decoration (including the gradient
          // border) is never animated — painted fresh every build.
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 26),
            decoration: BoxDecoration(
              color: _fill,
              borderRadius: BorderRadius.circular(100),
              border: GradientBoxBorder(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_purpleLight, _purple, _purpleDark],
                  stops: [0.0, 0.45, 1.0],
                ),
                width: 1.5,
              ),
            ),
            child: Text(
              widget.label.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
                fontSize: 13,
                letterSpacing: 1.0,
                color: _text,
              ),
            ),
          ),
        ),
      ),
    );

    return widget.expand
        ? SizedBox(width: double.infinity, child: content)
        : content;
  }
}

/// Paints a border with a gradient — Flutter's built-in Border doesn't
/// support gradients directly. Used only inside a static (never
/// animated) Container — see AnchorPrimaryButton's doc comment.
class GradientBoxBorder extends BoxBorder {
  const GradientBoxBorder({required this.gradient, this.width = 1.0});

  final Gradient gradient;
  final double width;

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final rrect =
        (borderRadius ?? BorderRadius.zero).toRRect(rect).deflate(width / 2);

    canvas.drawRRect(rrect, paint);
  }

  @override
  BoxBorder scale(double t) =>
      GradientBoxBorder(gradient: gradient, width: width * t);
}
