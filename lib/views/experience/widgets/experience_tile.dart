import 'package:flutter/material.dart';
import '../../../models/experience_model.dart';
import '../../../utils/hover_extensions.dart';
import '../../../utils/responsive_helper.dart';

class ExperienceTile extends StatelessWidget {
  final ExperienceModel experience;
  final bool isLast;

  const ExperienceTile({
    super.key,
    required this.experience,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roleFontSize = context.responsive<double>(
      mobile: 18,
      tablet: 22,
      desktop: 26,
    );
    final bottomPadding = context.responsive<double>(
      mobile: 28,
      tablet: 36,
      desktop: 44,
    );

    return HoverScaleWidget(
      scale: 1.01,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timeline line & dot
            Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.surface,
                      width: 3,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 20),
            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.role,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: roleFontSize,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${experience.company}  •  ${experience.period}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: context.responsive<double>(
                          mobile: 13,
                          tablet: 14,
                          desktop: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...experience.highlights.map((highlight) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '▹',
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: context.isMobile ? 14 : 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                highlight,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: context.responsive<double>(
                                    mobile: 13,
                                    tablet: 14,
                                    desktop: 15,
                                  ),
                                  height: 1.55,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

