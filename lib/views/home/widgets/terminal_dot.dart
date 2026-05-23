import 'package:flutter/material.dart';

class TerminalDot extends StatelessWidget {
  final Color color;

  const TerminalDot({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
