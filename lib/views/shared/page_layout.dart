import 'package:flutter/material.dart';

import '../../utils/responsive_helper.dart';
import 'side_navigation.dart';
import 'theme_toggle_button.dart';

class PageLayout extends StatelessWidget {
  final Widget child;

  const PageLayout({super.key, required this.child});

  // Height reserved for the floating top bar (hamburger + theme toggle).
  static const double _topBarHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Scaffold(
      drawer: isDesktop
          ? null
          : const Drawer(child: SideNavigation()),
      body: Stack(
        children: [
          Row(
            children: [
              if (isDesktop) const SideNavigation(),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    // Cap content width on ultra-wide monitors.
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: context.horizontalPadding,
                        right: context.horizontalPadding,
                        // Reserve space for the floating top bar on mobile/tablet.
                        top: isDesktop ? 24.0 : _topBarHeight + 8.0,
                        bottom: 24.0,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Floating top-bar: hamburger (mobile) + theme toggle.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isDesktop)
                      Builder(
                        builder: (ctx) => IconButton(
                          icon: const Icon(Icons.menu_rounded),
                          onPressed: () => Scaffold.of(ctx).openDrawer(),
                          tooltip: 'Open navigation',
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    const ThemeToggleButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

