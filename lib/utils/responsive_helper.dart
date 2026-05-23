import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  ResponsiveHelper._();

  static const double mobileMaxSize = 768;
  static const double tabletMaxSize = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMaxSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileMaxSize &&
      MediaQuery.of(context).size.width < tabletMaxSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMaxSize;

  /// Returns the appropriate value based on the current breakpoint.
  /// Falls back to [tablet] if not provided, then [desktop].
  static T value<T>(
    BuildContext context, {
    required T mobile,
    required T desktop, T? tablet,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? desktop;
    return desktop;
  }
}

extension ResponsiveContext on BuildContext {
  bool get isMobile => ResponsiveHelper.isMobile(this);
  bool get isTablet => ResponsiveHelper.isTablet(this);
  bool get isDesktop => ResponsiveHelper.isDesktop(this);

  /// Picks a value based on the current breakpoint.
  T responsive<T>({required T mobile, required T desktop, T? tablet}) =>
      ResponsiveHelper.value<T>(this, mobile: mobile, tablet: tablet, desktop: desktop);

  /// Responsive horizontal page padding.
  double get horizontalPadding => responsive(mobile: 20, tablet: 40, desktop: 60);

  /// Responsive vertical section spacing.
  double get sectionSpacing => responsive(mobile: 32, tablet: 48, desktop: 64);
}

