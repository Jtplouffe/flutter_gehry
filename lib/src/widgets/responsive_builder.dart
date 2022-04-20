import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Builder].
///
/// If no data has been provided for the current breakpoint, a [SizedBox.shrink] will be returned.
class ResponsiveBuilder extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<WidgetBuilder> data;

  ResponsiveBuilder({
    Key? key,
    WidgetBuilder? xs,
    WidgetBuilder? sm,
    WidgetBuilder? md,
    WidgetBuilder? lg,
    WidgetBuilder? xl,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final builder = data.getForBreakpoint(breakpoint);
    return builder?.call(context) ?? const SizedBox.shrink();
  }
}
