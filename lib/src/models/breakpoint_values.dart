import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

class BreakpointValues {
  /// Minimum width in pixel for the [Breakpoints.sm] breakpoint.
  /// Must be more than 0 (ie. [Breakpoints.xs]) less than [md].
  final double sm;

  /// Minimum width in pixel for the [Breakpoints.md] breakpoint.
  /// Must be more than [sm] and less than [lg].
  final double md;

  /// Minimum width in pixel for the [Breakpoints.lg] breakpoint.
  /// Must be more than [md] and less than [xl].
  final double lg;

  /// Minimum width in pixel for the [Breakpoints.xl] breakpoint.
  /// Must be more than [lg].
  final double xl;

  const BreakpointValues({
    this.sm = 640,
    this.md = 768,
    this.lg = 1024,
    this.xl = 1280,
  }) : assert(0 < sm && sm < md && md < lg && lg < xl);

  /// Returns the current [Breakpoints].
  Breakpoints getCurrentBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < sm) return Breakpoints.xs;
    if (width < md) return Breakpoints.sm;
    if (width < lg) return Breakpoints.md;
    if (width < xl) return Breakpoints.lg;
    return Breakpoints.xl;
  }
}
