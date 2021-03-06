import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Builder].
///
/// If no data has been provided for the current breakpoint, a [SizedBox.shrink] will be returned.
class ResponsiveBuilder extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<WidgetBuilder> data;

  ResponsiveBuilder({
    super.key,
    WidgetBuilder? xs,
    WidgetBuilder? sm,
    WidgetBuilder? md,
    WidgetBuilder? lg,
    WidgetBuilder? xl,
  }) : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final builder = data.getForBreakpoint(breakpoint);
    return builder?.call(context) ?? const SizedBox.shrink();
  }
}
