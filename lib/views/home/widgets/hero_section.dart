import 'dart:math' as math;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_assets.dart';
import '../../../utils/responsive_helper.dart';
import '../../../controllers/navigation_controller.dart';
import 'terminal_widget.dart';

import '../../../utils/hover_extensions.dart';

class HeroSection extends ConsumerWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDesktop = context.isDesktop;
    final isMobile = context.isMobile;

    final lottieHeight = context.responsive<double>(
      mobile: 200,
      tablet: 260,
      desktop: 320,
    );

    final avatarSize = context.responsive<double>(
      mobile: 100,
      tablet: 120,
      desktop: 140,
    );

    final animatedTextHeight = context.responsive<double>(
      mobile: 60,
      tablet: 72,
      desktop: 88,
    );

    final titleStyle = theme.textTheme.displayMedium?.copyWith(
      fontSize: context.responsive<double>(
        mobile: 28,
        tablet: 36,
        desktop: 48,
      ),
    );

    final content = Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        HoverScaleWidget(
          alignment: isDesktop ? Alignment.centerLeft : Alignment.center,
          child: Container(
            width: avatarSize,
            height: avatarSize,
            margin: EdgeInsets.only(
              left: isDesktop ? 16.0 : 0,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              // Premium organic border shape matching yl0.me aesthetic
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(45),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(65),
              ),
              border: Border.all(
                color: theme.colorScheme.primary,
                width: 3.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage(AppAssets.profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          AppStrings.title,
          style: titleStyle,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: animatedTextHeight,
          child: DefaultTextStyle(
            style: theme.textTheme.headlineMedium!.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: context.responsive<double>(
                mobile: 16,
                tablet: 20,
                desktop: 24,
              ),
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Hi, I\'m ${AppStrings.name}!'),
                TypewriterAnimatedText(AppStrings.subtitle),
                TypewriterAnimatedText('I build robust, clean architectures.'),
              ],
              repeatForever: true,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 28 : 40),
        ElevatedButton(
          onPressed: () {
            ref.read(navigationControllerProvider.notifier).state = 1;
            context.go('/projects');
          },
          child: const Text('SEE MY WORK →'),
        ),
      ],
    );

    final graphics = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: lottieHeight,
          child: kIsWeb
              ? _WebCodingIllustration(height: lottieHeight)
              : Lottie.asset(
                  AppAssets.codingAnimation,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.code, size: 100),
                ),
        ),
        const SizedBox(height: 16),
        const TerminalWidget(),
      ],
    );

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: content),
          const SizedBox(width: 48),
          Expanded(flex: 5, child: graphics),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        graphics,
        SizedBox(height: isMobile ? 32 : 48),
        content,
      ],
    );
  }
}

class _WebCodingIllustration extends StatelessWidget {
  final double height;

  const _WebCodingIllustration({required this.height});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final secondary = theme.colorScheme.secondary;

    return SizedBox(
      height: height,
      width: height * 1.2,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 4),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          final pulse = math.sin(value * 2 * math.pi); // smooth sin wave pulse [-1, 1]
          final normalizedPulse = (pulse + 1) / 2; // [0, 1]

          return Stack(
            alignment: Alignment.center,
            children: [
              // Background glowing orb
              Container(
                width: height * 0.7,
                height: height * 0.7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      primary.withValues(alpha: 0.15 * (0.8 + 0.4 * normalizedPulse)),
                      primary.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
              // Rotating outer dashed ring
              Transform.rotate(
                angle: value * 2 * math.pi,
                child: SizedBox(
                  width: height * 0.75,
                  height: height * 0.75,
                  child: CustomPaint(
                    painter: _OrbitPainter(
                      color: primary.withValues(alpha: 0.2),
                      dashLength: 10,
                      spaceLength: 8,
                    ),
                  ),
                ),
              ),
              // Counter-rotating inner ring
              Transform.rotate(
                angle: -value * 2 * math.pi * 1.5,
                child: SizedBox(
                  width: height * 0.55,
                  height: height * 0.55,
                  child: CustomPaint(
                    painter: _OrbitPainter(
                      color: secondary.withValues(alpha: 0.3),
                      dashLength: 15,
                      spaceLength: 12,
                    ),
                  ),
                ),
              ),
              // Central glowing glassmorphic terminal/dashboard card
              Container(
                width: height * 0.6,
                height: height * 0.45,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: primary.withValues(alpha: 0.25),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: primary.withValues(alpha: 0.12 * (1 + normalizedPulse)),
                      blurRadius: 20 + (10 * normalizedPulse),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      // Window Header
                      Container(
                        height: 28,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                        child: Row(
                          children: [
                            _buildDot(Colors.redAccent),
                            const SizedBox(width: 6),
                            _buildDot(Colors.amber),
                            const SizedBox(width: 6),
                            _buildDot(Colors.green),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'workspace.dart',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                                  fontFamily: 'monospace',
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Mock Code Editor Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCodeLine(primary, 0.4),
                              const SizedBox(height: 6),
                              _buildCodeLine(secondary, 0.65, indent: 12),
                              const SizedBox(height: 6),
                              _buildCodeLine(theme.colorScheme.tertiary, 0.5, indent: 24),
                              const SizedBox(height: 6),
                              _buildCodeLine(primary, 0.8, indent: 12),
                              const SizedBox(height: 6),
                              _buildCodeLine(secondary, 0.3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Glowing floating code symbols
              Positioned(
                top: height * 0.15 + (8 * normalizedPulse),
                left: height * 0.1,
                child: _buildFloatingIcon(Icons.widgets_rounded, primary, height * 0.1),
              ),
              Positioned(
                bottom: height * 0.1 + (12 * (1 - normalizedPulse)),
                right: height * 0.05,
                child: _buildFloatingIcon(Icons.terminal_rounded, secondary, height * 0.11),
              ),
              Positioned(
                top: height * 0.2 - (6 * normalizedPulse),
                right: height * 0.15,
                child: _buildFloatingIcon(Icons.bolt, Colors.amber, height * 0.09),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.85),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCodeLine(Color color, double widthPercent, {double indent = 0}) {
    return Row(
      children: [
        if (indent > 0) SizedBox(width: indent),
        Container(
          height: 6,
          width: 120 * widthPercent,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingIcon(IconData icon, Color color, double size) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Icon(
        icon,
        color: color,
        size: size * 0.5,
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final Color color;
  final double dashLength;
  final double spaceLength;

  _OrbitPainter({
    required this.color,
    required this.dashLength,
    required this.spaceLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final path = Path()..addOval(Rect.fromCircle(center: center, radius: radius));

    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final length = draw ? dashLength : spaceLength;
        if (distance + length > metric.length) {
          if (draw) {
            canvas.drawPath(
              metric.extractPath(distance, metric.length),
              paint,
            );
          }
          break;
        }
        if (draw) {
          canvas.drawPath(
            metric.extractPath(distance, distance + length),
            paint,
          );
        }
        distance += length;
        draw = !draw;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

