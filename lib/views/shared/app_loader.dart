import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/app_assets.dart';

class AppLoader extends StatelessWidget {
  final double size;

  const AppLoader({super.key, this.size = 150});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Lottie.asset(
          AppAssets.loadingAnimation,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
