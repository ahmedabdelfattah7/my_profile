import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/navigation_controller.dart';
import '../../core/constants/app_strings.dart';
import 'nav_item.dart';

class SideNavigation extends ConsumerWidget {
  const SideNavigation({super.key});

  static const List<Map<String, String>> navItems = [
    {'title': 'Home', 'route': '/'},
    {'title': 'Projects', 'route': '/projects'},
    {'title': 'Experience', 'route': '/experience'},
    {'title': 'About', 'route': '/about'},
    {'title': 'Contact', 'route': '/contact'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(navigationControllerProvider);
    final theme = Theme.of(context);
    final isInDrawer = Scaffold.maybeOf(context)?.hasDrawer ?? false;

    final navList = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(navItems.length, (index) {
        final isActive = activeIndex == index;
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: NavItem(
            index: index,
            title: navItems[index]['title']!,
            route: navItems[index]['route']!,
            isActive: isActive,
          ),
        );
      }),
    );

    // In a drawer (mobile/tablet) — show header + scrollable list.
    if (isInDrawer) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 40, 28, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.title,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24),
                  Divider(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.15),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
                child: navList,
              ),
            ),
          ],
        ),
      );
    }

    // Desktop sidebar.
    return SizedBox(
      width: 240,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        child: navList,
      ),
    );
  }
}

