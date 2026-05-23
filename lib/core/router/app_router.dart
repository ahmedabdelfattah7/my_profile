import 'package:ahmed_abdelfattah/core/router/fade_slide_transition_page.dart';
import 'package:ahmed_abdelfattah/views/about/about_screen.dart';
import 'package:ahmed_abdelfattah/views/contact/contact_screen.dart';
import 'package:ahmed_abdelfattah/views/experience/experience_screen.dart';
import 'package:ahmed_abdelfattah/views/home/home_screen.dart';
import 'package:ahmed_abdelfattah/views/projects/projects_screen.dart';
import 'package:ahmed_abdelfattah/views/shared/page_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
