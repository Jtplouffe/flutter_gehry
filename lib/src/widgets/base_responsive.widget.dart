import 'package:flutter/cupertino.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

abstract class BaseResponsiveWidget<D> extends StatelessWidget {
  final ResponsiveBreakpointData<D?> data;

  BaseResponsiveWidget({
    Key? key,
    D? sm,
    D? md,
    D? lg,
    D? xl,
    D? xxl,
  })  : data = ResponsiveBreakpointData(sm: sm, md: md, lg: lg, xl: xl, xxl: xxl),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context).getCurrentBreakpoint(context);
    final data = this.data.getForBreakpoint(breakpoint);

    return buildResponsive(context, breakpoint, data);
  }

  Widget buildResponsive(BuildContext context, Breakpoints breakpoint, D? data);
}
