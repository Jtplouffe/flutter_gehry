import 'package:flutter_gehry/flutter_gehry.dart';

/// Used to store some data for different breakpoints.
class ResponsiveBreakpointsData<D> {
  /// All of data, from xs to xl.
  final List<D?> data;

  ResponsiveBreakpointsData({
    required D? xs,
    required D? sm,
    required D? md,
    required D? lg,
    required D? xl,
  }) : data = [xs, sm, md, lg, xl];

  /// Returns the data for the breakpoint.
  /// This is a mobile-first approach, where if there is no data for the breakpoint,
  /// the data of the previous (smaller) non-null breakpoint will be used.
  D? getForBreakpoint(Breakpoints breakpoint) {
    // Start from the breakpoint and go down until a data is not null.
    for (int i = breakpoint.index; i >= 0; i--) {
      if (data[i] != null) return data[i];
    }

    return null;
  }
}
