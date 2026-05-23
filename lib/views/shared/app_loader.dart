import 'package:ahmed_abdelfattah/core/constants/app_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {

  const AppLoader({super.key, this.size = 150});
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (kIsWeb) {
      // Premium loading animation for Web to avoid CanvasKit path rendering bugs
      return Center(
        child: SizedBox(
          width: size,
          height: size,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Outer glowing ring
                  Container(
                    width: size * 0.7,
                    height: size * 0.7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.primary.withValues(alpha: 0.15),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.08 * (1 + value)),
                          blurRadius: 15 + (10 * value),
                          spreadRadius: 2 + (2 * value),
                        ),
                      ],
                    ),
                  ),
                  // Rotating gradient circular progress
                  SizedBox(
                    width: size * 0.5,
                    height: size * 0.5,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  // Inner decorative pulse
                  Container(
                    width: size * 0.2,
                    height: size * 0.2,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.secondary.withValues(alpha: 0.4),
                          blurRadius: 10 * value,
                          spreadRadius: 1 * value,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.code_rounded,
                      color: theme.colorScheme.onSecondary,
                      size: size * 0.12,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Lottie.asset(
          AppAssets.loadingAnimation,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

