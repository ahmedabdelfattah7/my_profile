import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'skill_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Technical Skills', style: theme.textTheme.headlineMedium),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: AppStrings.skills.map((skill) {
            return SkillChip(skill: skill);
          }).toList(),
        ),
      ],
    );
  }
}
