import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/project_model.dart';
import '../../../utils/url_launcher_helper.dart';
import '../../../utils/hover_extensions.dart';
import '../../../utils/responsive_helper.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardPadding = context.responsive<double>(
      mobile: 16,
      tablet: 20,
      desktop: 24,
    );
    final titleFontSize = context.responsive<double>(
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );

    return HoverTiltWidget(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        project.name,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontSize: titleFontSize,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.folder_open,
                      size: context.responsive<double>(
                        mobile: 22,
                        tablet: 24,
                        desktop: 28,
                      ),
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    project.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: context.responsive<double>(
                        mobile: 13,
                        tablet: 14,
                        desktop: 15,
                      ),
                      height: 1.5,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
                const SizedBox(height: 12),
                // Tech Stack
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: project.technologies.map((tech) {
                    return Text(
                      tech,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                // Store Links
                Row(
                  children: [
                    if (project.appStoreUrl != null)
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.appStore,
                          size: 18,
                        ),
                        onPressed: () =>
                            UrlLauncherHelper.openUrl(project.appStoreUrl!),
                        tooltip: 'App Store',
                        visualDensity: VisualDensity.compact,
                      ),
                    if (project.playStoreUrl != null)
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.googlePlay,
                          size: 18,
                        ),
                        onPressed: () =>
                            UrlLauncherHelper.openUrl(project.playStoreUrl!),
                        tooltip: 'Play Store',
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

