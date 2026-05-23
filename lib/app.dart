import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/theme_controller.dart';
import 'controllers/loading_controller.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'views/loading/loading_screen.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final isLoading = ref.watch(appLoadingProvider);

    return MaterialApp.router(
      title: 'Ahmed Abdelfattah - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
      builder: (context, child) {
        if (isLoading) {
          return const LoadingScreen();
        }
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
