import 'package:flutter_responsive_layout/src/enums/breakpoints.enum.dart';

/// Used to store some data for different breakpoints.
class ResponsiveBreakpointData<D> {
  /// All of data, from sm to xxl.
  final List<D?> data;

  ResponsiveBreakpointData({
    required D? sm,
    required D? md,
    required D? lg,
    required D? xl,
    required D? xxl,
  }) : data = [sm, md, lg, xl, xxl];

  /// Returns the data fro for the breakpoint.
  /// This is a mobile-first approach, where if there is no data for the breakpoint,
  /// 1the data of the next non-null smaller breakpoint will be used.
  D? getForBreakpoint(Breakpoints breakpoint) {
    // Start from the breakpoint and go down until a data is not null.
    for (int i = breakpoint.index; i >= 0; i--) {
      if (data[i] != null) return data[i];
    }

    return null;
  }
}
