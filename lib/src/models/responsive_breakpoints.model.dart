import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/src/enums/breakpoints.enum.dart';

class ResponsiveBreakpoints {
  /// Minimum width in pixel for the [Breakpoints.md] breakpoint.
  /// Must be more than 0 [Breakpoints.sm] less than [lg].
  final double md;

  /// Minimum width in pixel for the [Breakpoints.lg] breakpoint.
  /// Must be more than [md] and less than [xl].
  final double lg;

  /// Minimum width in pixel for the [Breakpoints.xl] breakpoint.
  /// Must be more than [lg] and less than [xxl].
  final double xl;

  /// Minimum width in pixel for the [Breakpoints.xxl] breakpoint.
  /// Must be more than [xl].
  final double xxl;

  const ResponsiveBreakpoints({
    this.md = 460,
    this.lg = 768,
    this.xl = 1024,
    this.xxl = 1280,
  }) : assert(0 < md && md < lg && lg < xl && xl < xxl);

  /// Returns the current [Breakpoints].
  Breakpoints getCurrentBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < md) return Breakpoints.sm;
    if (width < lg) return Breakpoints.md;
    if (width < xl) return Breakpoints.lg;
    if (width < xxl) return Breakpoints.xl;
    return Breakpoints.xxl;
  }
}
