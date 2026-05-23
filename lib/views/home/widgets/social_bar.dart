import 'package:ahmed_abdelfattah/core/constants/app_strings.dart';
import 'package:ahmed_abdelfattah/utils/url_launcher_helper.dart';
import 'package:ahmed_abdelfattah/views/home/widgets/social_link.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialBar extends StatelessWidget {
  const SocialBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 20,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SocialLink(
          name: 'GitHub',
          icon: FontAwesomeIcons.github,
          onTap: () => UrlLauncherHelper.openUrl(AppStrings.githubUrl),
        ),
        Text('/', style: theme.textTheme.bodyMedium),
        SocialLink(
          name: 'LinkedIn',
          icon: FontAwesomeIcons.linkedinIn,
          onTap: () => UrlLauncherHelper.openUrl(AppStrings.linkedinUrl),
        ),
        Text('/', style: theme.textTheme.bodyMedium),
        SocialLink(
          name: 'Email',
          icon: FontAwesomeIcons.solidEnvelope,
          onTap: () => UrlLauncherHelper.openEmail(AppStrings.email),
        ),
      ],
    );
  }
}
