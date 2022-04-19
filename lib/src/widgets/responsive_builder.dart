import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

class ResponsiveBuilder extends BaseResponsiveWidget {
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
