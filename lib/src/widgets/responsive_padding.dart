import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Padding].
class ResponsivePadding extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<EdgeInsets> data;

  /// Child of the [Padding].
  final Widget child;

  ResponsivePadding({
    super.key,
    EdgeInsets? xs,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    required this.child,
  }) : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final padding = data.getForBreakpoint(breakpoint);

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );
  }
}
