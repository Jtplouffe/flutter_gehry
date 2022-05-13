import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [DecoratedBox].
///
/// If no data has been provided for the current breakpoint, the [child] will be directly returned, without a [DecoratedBox].
/// If the [child] is null, a [SizedBox.shrink] will be returned instead.
class ResponsiveDecoratedBox extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<Decoration> data;

  /// Child of the [DecoratedBox].
  final Widget? child;

  ResponsiveDecoratedBox({
    super.key,
    Decoration? xs,
    Decoration? sm,
    Decoration? md,
    Decoration? lg,
    Decoration? xl,
    this.child,
  }) : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final boxDecoration = data.getForBreakpoint(breakpoint);

    return DecoratedBox(
      decoration: boxDecoration ?? const BoxDecoration(),
      child: child,
    );
  }
}
