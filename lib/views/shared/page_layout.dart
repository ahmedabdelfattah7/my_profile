import 'package:ahmed_abdelfattah/utils/responsive_helper.dart';
import 'package:ahmed_abdelfattah/views/shared/side_navigation.dart';
import 'package:ahmed_abdelfattah/views/shared/tech_background.dart';
import 'package:ahmed_abdelfattah/views/shared/theme_toggle_button.dart';
import 'package:flutter/material.dart';

class PageLayout extends StatelessWidget {

  const PageLayout({required this.child, super.key});
  final Widget child;

  // Height reserved for the floating top bar (hamburger + theme toggle).
  static const double _topBarHeight = 64;

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    return Scaffold(
      drawer: isDesktop
          ? null
          : const Drawer(child: SideNavigation()),
      body: Stack(
        children: [
          const TechBackground(),
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
                        bottom: 24,
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
                  horizontal: 12,
                  vertical: 8,
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

