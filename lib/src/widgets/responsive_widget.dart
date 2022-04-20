import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Displays the widget for the current breakpoint,
/// or a [SizedBox.shrink)] if no data has been provided for the breakpoint.
class ResponsiveWidget extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<Widget> data;

  ResponsiveWidget({
    Key? key,
    Widget? xs,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(
          key: key,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return data.getForBreakpoint(breakpoint) ?? const SizedBox.shrink();
  }
}
