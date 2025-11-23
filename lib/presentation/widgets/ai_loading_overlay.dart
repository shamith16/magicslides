import 'dart:math' as math;
import 'dart:ui' as ui show BlurStyle, ImageFilter, MaskFilter;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../theme/brand_colors.dart';

/// Animated border overlay inspired by AI visualizations.
class AiLoadingOverlay extends StatefulWidget {
  final bool visible;
  final Widget child;
  final String? message;

  const AiLoadingOverlay({
    super.key,
    required this.visible,
    required this.child,
    this.message,
  });

  @override
  State<AiLoadingOverlay> createState() => _AiLoadingOverlayState();
}

class _AiLoadingOverlayState extends State<AiLoadingOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    if (widget.visible) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant AiLoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.visible && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AbsorbPointer(absorbing: widget.visible, child: widget.child),
        IgnorePointer(
          ignoring: !widget.visible,
          child: AnimatedOpacity(
            opacity: widget.visible ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: _AiBorderPainter(progress: _controller.value),
                ),
                IgnorePointer(
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.7),
                                borderRadius: BorderRadius.circular(200),
                                boxShadow: [
                                  BoxShadow(
                                    color: BrandColors.primary.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Lottie.asset(
                                  'assets/ai_loading.json',
                                  repeat: true,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(32),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.75),
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  widget.message ?? 'Generating presentation…',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AiBorderPainter extends CustomPainter {
  final double progress;

  _AiBorderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final gradient = SweepGradient(
      colors: const [
        BrandColors.primary,
        BrandColors.secondary,
        BrandColors.primaryDark,
        BrandColors.primary,
      ],
      stops: const [0.0, 0.4, 0.7, 1.0],
      transform: GradientRotation(progress * 2 * math.pi),
    );

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..maskFilter = const ui.MaskFilter.blur(ui.BlurStyle.normal, 12)
      ..shader = gradient.createShader(rect);

    final borderRect = rect.deflate(12);
    final rrect = RRect.fromRectAndRadius(
      borderRect,
      const Radius.circular(32),
    );
    final path = Path()..addRRect(rrect);

    final double fastPulse = 0.5 + 0.5 * math.sin(progress * 2 * math.pi);
    final double slowPulse = 0.5 + 0.5 * math.sin(progress * math.pi);

    final slowGlowPaint = glowPaint
      ..strokeWidth = 12 + slowPulse * 6
      ..maskFilter = ui.MaskFilter.blur(
        ui.BlurStyle.normal,
        10 + slowPulse * 4,
      );

    final fastGlowPaint = glowPaint
      ..strokeWidth = 6 + fastPulse * 4
      ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, 6 + fastPulse * 3);

    canvas.drawPath(path, slowGlowPaint);
    canvas.drawPath(path, fastGlowPaint);
  }

  @override
  bool shouldRepaint(covariant _AiBorderPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
