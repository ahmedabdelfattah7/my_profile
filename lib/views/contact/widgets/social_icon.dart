import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({required this.icon, required this.onTap, super.key});

  final FaIconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: HoverScaleWidget(
        scale: 1.2,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: FaIcon(icon, size: 32, color: theme.colorScheme.primary),
        ),
      ),
    );
  }
}
