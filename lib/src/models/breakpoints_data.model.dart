import 'package:flutter_gehry/flutter_gehry.dart';

/// Used to store some data for different breakpoints.
class BreakpointsData<D> {
  final D? xs;
  final D? sm;
  final D? md;
  final D? lg;
  final D? xl;

  const BreakpointsData({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  const BreakpointsData.all(D data)
      : xs = data,
        sm = data,
        md = data,
        lg = data,
        xl = data;

  /// Returns the data for the breakpoint.
  /// This is a mobile-first approach, where if there is no data for the breakpoint,
  /// the data of the previous (smaller) non-null breakpoint will be used.
  D? getForBreakpoint(Breakpoints breakpoint) {
    // Start from the breakpoint and go down until a data is not null.
    if (breakpoint == Breakpoints.xl && xl != null) return xl;
    if (breakpoint >= Breakpoints.lg && lg != null) return lg;
    if (breakpoint >= Breakpoints.md && md != null) return md;
    if (breakpoint >= Breakpoints.sm && sm != null) return sm;
    if (breakpoint >= Breakpoints.xs && xs != null) return xs;
    return null;
  }
}
