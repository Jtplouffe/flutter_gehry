import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [DecoratedBox].
///
/// If no data has been provided for the current breakpoint, the [child] will be directly returned, without a [DecoratedBox].
/// If the [child] is null, a [SizedBox.shrink] will be returned instead.
class ResponsiveDecoratedBox extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<Decoration> data;

  /// Child of the [DecoratedBox].
  final Widget? child;

  ResponsiveDecoratedBox({
    Key? key,
    Decoration? xs,
    Decoration? sm,
    Decoration? md,
    Decoration? lg,
    Decoration? xl,
    this.child,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final boxDecoration = data.getForBreakpoint(breakpoint);
    if (boxDecoration == null) return child ?? const SizedBox.shrink();

    return DecoratedBox(
      decoration: boxDecoration,
      child: child,
    );
  }
}
