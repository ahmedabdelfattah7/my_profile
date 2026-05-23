import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_assets.dart';
import '../../../utils/responsive_helper.dart';
import '../../../controllers/navigation_controller.dart';
import 'terminal_widget.dart';

import '../../../utils/hover_extensions.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDesktop = context.isDesktop;
    final isMobile = context.isMobile;

    final lottieHeight = context.responsive<double>(
      mobile: 200,
      tablet: 260,
      desktop: 320,
    );

    final avatarSize = context.responsive<double>(
      mobile: 100,
      tablet: 120,
      desktop: 140,
    );

    final animatedTextHeight = context.responsive<double>(
      mobile: 60,
      tablet: 72,
      desktop: 88,
    );

    final titleStyle = theme.textTheme.displayMedium?.copyWith(
      fontSize: context.responsive<double>(
        mobile: 28,
        tablet: 36,
        desktop: 48,
      ),
    );

    final content = Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        HoverScaleWidget(
          alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            margin: EdgeInsets.only(
              left: isDesktop ? 16.0 : 0,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              // Premium organic border shape matching yl0.me aesthetic
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(45),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(65),
              ),
              border: Border.all(
                color: theme.colorScheme.primary,
                width: 3.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(AppAssets.profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          AppStrings.title,
          style: titleStyle,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: animatedTextHeight,
          child: DefaultTextStyle(
            style: theme.textTheme.headlineMedium!.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: context.responsive<double>(
                mobile: 16,
                tablet: 20,
                desktop: 24,
              ),
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Hi, I\'m ${AppStrings.name}!'),
                TypewriterAnimatedText(AppStrings.subtitle),
                TypewriterAnimatedText('I build robust, clean architectures.'),
              ],
              repeatForever: true,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 28 : 40),
        ElevatedButton(
          onPressed: () {
            ref.read(navigationControllerProvider.notifier).state = 1;
            context.go('/projects');
          },
          child: const Text('SEE MY WORK →'),
        ),
      ],
    );

    final graphics = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: lottieHeight,
          child: Lottie.asset(
            AppAssets.codingAnimation,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.code, size: 100),
          ),
        ),
        const SizedBox(height: 16),
        const TerminalWidget(),
      ],
    );

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: content),
          const SizedBox(width: 48),
          Expanded(flex: 5, child: graphics),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        graphics,
        SizedBox(height: isMobile ? 32 : 48),
        content,
      ],
    );
  }
}

