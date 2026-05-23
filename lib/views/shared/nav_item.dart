import 'package:ahmed_abdelfattah/controllers/navigation_controller.dart';
import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavItem extends ConsumerWidget {

  const NavItem({
    required this.index, required this.title, required this.route, required this.isActive, super.key,
  });
  final int index;
  final String title;
  final String route;
  final bool isActive;

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
