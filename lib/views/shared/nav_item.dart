import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/navigation_controller.dart';
import '../../utils/hover_extensions.dart';

class NavItem extends ConsumerWidget {
  final int index;
  final String title;
  final String route;
  final bool isActive;

  const NavItem({
    super.key,
    required this.index,
    required this.title,
    required this.route,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final color = isActive
        ? theme.colorScheme.onSurface
        : theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return InkWell(
      onTap: () {
        ref.read(navigationControllerProvider.notifier).state = index;
        context.go(route);
        // If it's a mobile drawer, close it
        if (Scaffold.of(context).isDrawerOpen) {
          Navigator.of(context).pop();
        }
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: HoverScaleWidget(
        scale: 1.05,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive)
              Container(
                margin: const EdgeInsets.only(right: 12),
                height: 2,
                width: 30,
                color: theme.colorScheme.primary,
              ),
            Text(
              '0${index + 1}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: color,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
