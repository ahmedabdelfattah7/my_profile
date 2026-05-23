import 'package:flutter/material.dart';
import '../shared/animated_section.dart';
import '../../../utils/responsive_helper.dart';
import 'widgets/profile_section.dart';
import 'widgets/skills_section.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = context.isDesktop;
    final columnSpacing = context.responsive<double>(
      mobile: 0,
      tablet: 36,
      desktop: 60,
    );

    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSection(
                child: Text(
                  'About Me',
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
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: AnimatedSection(
                        delay: Duration(milliseconds: 100),
                        child: ProfileSection(),
                      ),
                    ),
                    SizedBox(width: columnSpacing),
                    const Expanded(
                      flex: 3,
                      child: AnimatedSection(
                        delay: Duration(milliseconds: 200),
                        child: SkillsSection(),
                      ),
                    ),
                  ],
                )
              else
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSection(
                      delay: Duration(milliseconds: 100),
                      child: ProfileSection(),
                    ),
                    SizedBox(height: 40),
                    AnimatedSection(
                      delay: Duration(milliseconds: 200),
                      child: SkillsSection(),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

