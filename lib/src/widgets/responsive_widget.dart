import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// Displays the widget for the current breakpoint,
/// or an empty [SizedBox] if no data has been provided for the breakpoint.
class ResponsiveWidget extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<Widget> data;

  ResponsiveWidget({
    Key? key,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
    Widget? xxl,
  })  : data = ResponsiveBreakpointData(sm: sm, md: md, lg: lg, xl: xl, xxl: xxl),
        super(
          key: key,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return data.getForBreakpoint(breakpoint) ?? const SizedBox.shrink();
  }
}
