import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../shared/animated_section.dart';
import '../../../utils/responsive_helper.dart';
import 'widgets/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final crossAxisCount = context.responsive<int>(
      mobile: 1,
      tablet: 2,
      desktop: 2,
    );

    final childAspectRatio = context.responsive<double>(
      mobile: 1.4,
      tablet: 1.2,
      desktop: 1.5,
    );

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSection(
              child: Text('My Projects', style: theme.textTheme.displayMedium?.copyWith(
                fontSize: context.responsive<double>(mobile: 28, tablet: 36, desktop: 48),
              )),
            ),
            const SizedBox(height: 12),
            AnimatedSection(
              delay: const Duration(milliseconds: 100),
              child: Text(
                'Here are some of the selected projects that showcase my passion for building high-quality mobile and web applications.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: context.responsive<double>(mobile: 14, tablet: 16, desktop: 18),
                ),
              ),
            ),
            SizedBox(height: context.sectionSpacing),
            AnimatedSection(
              delay: const Duration(milliseconds: 200),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: AppStrings.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: AppStrings.projects[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

