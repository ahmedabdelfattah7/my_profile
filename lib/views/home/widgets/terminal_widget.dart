import 'package:ahmed_abdelfattah/core/constants/app_strings.dart';
import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:ahmed_abdelfattah/views/home/widgets/terminal_dot.dart';
import 'package:flutter/material.dart';

class TerminalWidget extends StatelessWidget {
  const TerminalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverTiltWidget(
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 420),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Terminal Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF2D2D2D),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: const Row(
                children: [
                  TerminalDot(color: Colors.redAccent),
                  SizedBox(width: 6),
                  TerminalDot(color: Colors.amber),
                  SizedBox(width: 6),
                  TerminalDot(color: Colors.green),
                ],
              ),
            ),
            // Terminal Content
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                AppStrings.terminalJoke,
                style: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 13,
                  color: Colors.greenAccent,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

