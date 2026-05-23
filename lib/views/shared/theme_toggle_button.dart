import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/theme_controller.dart';
import '../../utils/hover_extensions.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = themeMode == ThemeMode.dark;

    return HoverScaleWidget(
      child: IconButton(
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) => RotationTransition(
            turns: child.key == const ValueKey('moon')
                ? Tween<double>(begin: 0.5, end: 1).animate(anim)
                : Tween<double>(begin: 0, end: 0.5).animate(anim),
            child: ScaleTransition(scale: anim, child: child),
          ),
          child: isDark
              ? const Icon(
                  Icons.nightlight_round,
                  key: ValueKey('moon'),
                  color: Colors.amber,
                )
              : const Icon(
                  Icons.wb_sunny_rounded,
                  key: ValueKey('sun'),
                  color: Colors.orange,
                ),
        ),
        onPressed: () {
          ref.read(themeControllerProvider.notifier).toggleTheme();
        },
        tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      ),
    );
  }
}
