import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Displays the widget for the current breakpoint,
/// or a [SizedBox.shrink)] if no data has been provided for the breakpoint.
class ResponsiveWidget extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<Widget> data;

  ResponsiveWidget({
    super.key,
    Widget? xs,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
  }) : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return data.getForBreakpoint(breakpoint) ?? const SizedBox.shrink();
  }
}
