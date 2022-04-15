import 'package:flutter_responsive_layout/src/enums/breakpoints.enum.dart';

class ResponsiveBreakpointData<D> {
  final D sm;
  final D md;
  final D lg;
  final D xl;
  final D xxl;

  const ResponsiveBreakpointData({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  D? getForBreakpoint(Breakpoints breakpoint) {
    if (breakpoint == Breakpoints.sm && sm != null) return sm;
    if (breakpoint <= Breakpoints.md && md != null) return md;
    if (breakpoint <= Breakpoints.lg && lg != null) return lg;
    if (breakpoint <= Breakpoints.xl && xl != null) return xl;
    return xxl;
  }
}
