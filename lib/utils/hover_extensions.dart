import 'package:flutter/material.dart';

class HoverScaleWidget extends StatefulWidget {
  final Widget child;
  final double scale;
  final Alignment alignment;

  const HoverScaleWidget({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.alignment = Alignment.center,
  });

  @override
  State<HoverScaleWidget> createState() => _HoverScaleWidgetState();
}

class _HoverScaleWidgetState extends State<HoverScaleWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scale : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: widget.alignment,
        child: widget.child,
      ),
    );
  }
}

class HoverTiltWidget extends StatefulWidget {
  final Widget child;

  const HoverTiltWidget({super.key, required this.child});

  @override
  State<HoverTiltWidget> createState() => _HoverTiltWidgetState();
}

class _HoverTiltWidgetState extends State<HoverTiltWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: _isHovered
            ? (Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(0.02)
                ..rotateY(-0.02)
                ..setTranslationRaw(0.0, -5.0, 0.0))
            : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }
}
