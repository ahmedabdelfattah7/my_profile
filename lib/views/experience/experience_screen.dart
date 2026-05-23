import 'package:ahmed_abdelfattah/core/constants/app_strings.dart';
import 'package:ahmed_abdelfattah/utils/responsive_helper.dart';
import 'package:ahmed_abdelfattah/views/experience/widgets/experience_tile.dart';
import 'package:ahmed_abdelfattah/views/shared/animated_section.dart';
import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          // Timeline reads best at a comfortable reading width.
          constraints: const BoxConstraints(maxWidth: 860),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSection(
                child: Text(
                  'My Experience',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontSize: context.responsive<double>(
                      mobile: 28,
                      tablet: 36,
                      desktop: 48,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.sectionSpacing),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppStrings.experience.length,
                itemBuilder: (context, index) {
                  return AnimatedSection(
                    delay: Duration(milliseconds: 100 * index),
                    child: ExperienceTile(
                      experience: AppStrings.experience[index],
                      isLast: index == AppStrings.experience.length - 1,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

