import 'package:flutter/material.dart';

class TerminalDot extends StatelessWidget {

  const TerminalDot({required this.color, super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
