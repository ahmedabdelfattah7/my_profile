
import 'package:ahmed_abdelfattah/controllers/navigation_controller.dart';
import 'package:ahmed_abdelfattah/core/constants/app_assets.dart';
import 'package:ahmed_abdelfattah/core/constants/app_strings.dart';
import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:ahmed_abdelfattah/utils/responsive_helper.dart';
import 'package:ahmed_abdelfattah/views/home/widgets/terminal_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDesktop = context.isDesktop;
    final isMobile = context.isMobile;

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
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
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
                TypewriterAnimatedText("Hi, I'm ${AppStrings.name}!"),
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

    const graphics = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16),
        TerminalWidget(),
      ],
    );

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 5, child: content),
          const SizedBox(width: 48),
          const Expanded(flex: 5, child: graphics),
        ],
      );
    }

    return Column(
      children: [
        // Premium Mobile Hero Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            children: [
              HoverScaleWidget(
                child: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
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
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.25,
                        ),
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
              const SizedBox(height: 24),
              Text(
                AppStrings.title,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
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
                  textAlign: TextAlign.center,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("Hi, I'm ${AppStrings.name}!"),
                      TypewriterAnimatedText(AppStrings.subtitle),
                      TypewriterAnimatedText(
                        'I build robust, clean architectures.',
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.read(navigationControllerProvider.notifier).state = 1;
                  context.go('/projects');
                },
                child: const Text('SEE MY WORK →'),
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 32 : 48),
        graphics,
      ],
    );
  }
}


