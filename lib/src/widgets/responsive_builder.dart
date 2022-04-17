import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

class ResponsiveBuilder extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<WidgetBuilder> data;

  ResponsiveBuilder({
    Key? key,
    WidgetBuilder? xs,
    WidgetBuilder? sm,
    WidgetBuilder? md,
    WidgetBuilder? lg,
    WidgetBuilder? xl,
  })  : data = ResponsiveBreakpointData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final builder = data.getForBreakpoint(breakpoint);
    return builder?.call(context) ?? const SizedBox.shrink();
  }
}
