import 'package:flutter/material.dart';

class HoverScaleWidget extends StatefulWidget {

  const HoverScaleWidget({
    required this.child, super.key,
    this.scale = 1.05,
    this.alignment = Alignment.center,
  });
  final Widget child;
  final double scale;
  final Alignment alignment;

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

  const HoverTiltWidget({required this.child, super.key});
  final Widget child;

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
                ..setTranslationRaw(0, -5, 0))
            : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }
}
