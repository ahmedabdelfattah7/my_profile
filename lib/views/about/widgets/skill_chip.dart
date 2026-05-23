import 'package:ahmed_abdelfattah/models/skill_model.dart';
import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {

  const SkillChip({required this.skill, super.key});
  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return HoverScaleWidget(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          skill.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
