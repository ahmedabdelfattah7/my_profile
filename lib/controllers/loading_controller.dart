import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLoadingProvider = StateNotifierProvider<AppLoadingController, bool>((ref) {
  return AppLoadingController();
});

class AppLoadingController extends StateNotifier<bool> {
  AppLoadingController() : super(true) {
    // Automatically turn off loading screen after a short delay to give a premium feel
    Future.delayed(const Duration(milliseconds: 2000), () {
      state = false;
    });
  }
}
