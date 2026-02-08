import 'package:flutter/material.dart';

class TapScaleContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final Color color;

  const TapScaleContainer({
    super.key,
    required this.child,
    required this.borderRadius,
    required this.color,
    this.onTap,
  });

  @override
  State<TapScaleContainer> createState() => _TapScaleContainerState();
}

class _TapScaleContainerState extends State<TapScaleContainer> {
  bool _animating = false;

  Future<void> _handleTap() async {
    if (_animating) return;

    setState(() => _animating = true);

    await Future.delayed(const Duration(milliseconds: 90));

    widget.onTap?.call();

    await Future.delayed(const Duration(milliseconds: 90));

    if (mounted) {
      setState(() => _animating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _animating ? 0.96 : 1.0,
      duration: const Duration(milliseconds: 90),
      curve: Curves.easeOutCubic,
      child: Material(
        color: widget.color,
        shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
        child: InkWell(
          borderRadius: widget.borderRadius,
          onTap: _handleTap,
          child: widget.child,
        ),
      ),
    );
  }
}
