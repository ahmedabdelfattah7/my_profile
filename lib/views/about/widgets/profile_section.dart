import 'package:ahmed_abdelfattah/core/constants/app_assets.dart';
import 'package:ahmed_abdelfattah/core/constants/app_strings.dart';
import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:ahmed_abdelfattah/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = context.isMobile;
    final imageSize = context.responsive<double>(
      mobile: 180,
      tablet: 220,
      desktop: MediaQuery.of(context).size.width < 1200 ? 200 : 250,
    );

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Align(
          child: HoverScaleWidget(
            child: Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 4,
                ),
                image: const DecorationImage(
                  image: AssetImage(AppAssets.profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Summary',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: context.responsive<double>(
              mobile: 18,
              tablet: 22,
              desktop: 26,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.summary,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.65,
            fontSize: context.responsive<double>(
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 28),
        Text(
          'Education',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: context.responsive<double>(
              mobile: 18,
              tablet: 22,
              desktop: 26,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          AppStrings.education,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.65,
            fontSize: context.responsive<double>(
              mobile: 14,
              tablet: 15,
              desktop: 16,
            ),
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }
}

