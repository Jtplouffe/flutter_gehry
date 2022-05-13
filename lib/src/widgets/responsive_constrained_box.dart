import 'package:flutter/cupertino.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [ConstrainedBox].
///
/// If no [BoxConstraints] has been provided for the current breakpoint, the child will be directly returned, without any [ConstrainedBox].
/// If [child] is also null, a [SizedBox.shrink] will be returned.
class ResponsiveConstrainedBox extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<BoxConstraints> data;

  /// Child of the [ConstrainedBox].
  final Widget? child;

  ResponsiveConstrainedBox({
    super.key,
    BoxConstraints? xs,
    BoxConstraints? sm,
    BoxConstraints? md,
    BoxConstraints? lg,
    BoxConstraints? xl,
    required this.child,
  }) : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final constraints = data.getForBreakpoint(breakpoint);

    return ConstrainedBox(
      constraints: constraints ?? const BoxConstraints(),
      child: child,
    );
  }
}
