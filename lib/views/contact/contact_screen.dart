import 'package:ahmed_abdelfattah/core/constants/app_strings.dart';
import 'package:ahmed_abdelfattah/utils/responsive_helper.dart';
import 'package:ahmed_abdelfattah/utils/url_launcher_helper.dart';
import 'package:ahmed_abdelfattah/views/contact/widgets/contact_item.dart';
import 'package:ahmed_abdelfattah/views/contact/widgets/social_icon.dart';
import 'package:ahmed_abdelfattah/views/shared/animated_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardPadding = context.responsive<double>(
      mobile: 20,
      tablet: 32,
      desktop: 44,
    );

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSection(
              child: Text(
                "Let's work together!",
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontSize: context.responsive<double>(
                    mobile: 26,
                    tablet: 36,
                    desktop: 48,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            AnimatedSection(
              delay: const Duration(milliseconds: 100),
              child: Text(
                "I'm available for Freelancing & Full-time Roles",
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: context.responsive<double>(
                    mobile: 16,
                    tablet: 20,
                    desktop: 26,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: context.sectionSpacing),
            AnimatedSection(
              delay: const Duration(milliseconds: 200),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ContactItem(
                        icon: Icons.email_outlined,
                        label: AppStrings.email,
                        onTap: () =>
                            UrlLauncherHelper.openEmail(AppStrings.email),
                      ),
                      const SizedBox(height: 20),
                      ContactItem(
                        icon: Icons.phone_outlined,
                        label: AppStrings.phone,
                        onTap: () =>
                            UrlLauncherHelper.openPhone(AppStrings.phone),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIcon(
                            icon: FontAwesomeIcons.github,
                            onTap: () => UrlLauncherHelper.openUrl(
                              AppStrings.githubUrl,
                            ),
                          ),
                          const SizedBox(width: 28),
                          SocialIcon(
                            icon: FontAwesomeIcons.linkedinIn,
                            onTap: () => UrlLauncherHelper.openUrl(
                              AppStrings.linkedinUrl,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 64),
            AnimatedSection(
              delay: const Duration(milliseconds: 300),
              child: Text(
                'Built using Flutter with ❤️',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedSection(
              delay: const Duration(milliseconds: 300),
              child: Text(
                '© 2026 ${AppStrings.name}',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

