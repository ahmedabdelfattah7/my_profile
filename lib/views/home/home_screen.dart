import 'package:ahmed_abdelfattah/views/home/widgets/hero_section.dart';
import 'package:ahmed_abdelfattah/views/home/widgets/social_bar.dart';
import 'package:ahmed_abdelfattah/views/shared/animated_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSection(child: HeroSection()),
            SizedBox(height: 60),
            AnimatedSection(
              delay: Duration(milliseconds: 300),
              child: SocialBar(),
            ),
          ],
        ),
      ),
    );
  }
}
