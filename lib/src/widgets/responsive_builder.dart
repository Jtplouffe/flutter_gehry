import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

class ResponsiveBuilder extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<WidgetBuilder> data;

  ResponsiveBuilder({
    Key? key,
    WidgetBuilder? sm,
    WidgetBuilder? md,
    WidgetBuilder? lg,
    WidgetBuilder? xl,
    WidgetBuilder? xxl,
  })  : data = ResponsiveBreakpointData(sm: sm, md: md, lg: lg, xl: xl, xxl: xxl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final builder = data.getForBreakpoint(breakpoint);
    return builder?.call(context) ?? const SizedBox.shrink();
  }
}
