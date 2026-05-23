import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../views/home/home_screen.dart';
import '../../views/projects/projects_screen.dart';
import '../../views/experience/experience_screen.dart';
import '../../views/about/about_screen.dart';
import '../../views/contact/contact_screen.dart';
import '../../views/shared/page_layout.dart';
import 'fade_slide_transition_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return PageLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => FadeSlideTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => FadeSlideTransitionPage(
            key: state.pageKey,
            child: const ProjectsScreen(),
          ),
        ),
        GoRoute(
          path: '/experience',
          pageBuilder: (context, state) => FadeSlideTransitionPage(
            key: state.pageKey,
            child: const ExperienceScreen(),
          ),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) => FadeSlideTransitionPage(
            key: state.pageKey,
            child: const AboutScreen(),
          ),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) => FadeSlideTransitionPage(
            key: state.pageKey,
            child: const ContactScreen(),
          ),
        ),
      ],
    ),
  ],
);
