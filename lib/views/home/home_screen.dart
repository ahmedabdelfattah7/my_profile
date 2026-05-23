import 'package:flutter/material.dart';
import 'widgets/hero_section.dart';
import 'widgets/social_bar.dart';
import '../../views/shared/animated_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimatedSection(child: HeroSection()),
            const SizedBox(height: 60),
            AnimatedSection(
              delay: const Duration(milliseconds: 300),
              child: SocialBar(),
            ),
          ],
        ),
      ),
    );
  }
}
