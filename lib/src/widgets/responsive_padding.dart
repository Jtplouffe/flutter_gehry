import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// Wrapper around [Padding].
class ResponsivePadding extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<EdgeInsets> data;
  final Widget child;

  ResponsivePadding({
    Key? key,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    EdgeInsets? xxl,
    required this.child,
  })  : data = ResponsiveBreakpointData(sm: sm, md: md, lg: lg, xl: xl, xxl: xxl),
        super(
          key: key,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final padding = data.getForBreakpoint(breakpoint);

    if (padding == null) return child;

    return Padding(
      padding: padding,
      child: child,
    );
  }
}
