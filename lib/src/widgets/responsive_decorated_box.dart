import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [DecoratedBox].
class ResponsiveDecoratedBox extends BaseResponsiveWidget {
  final ResponsiveBreakpointsData<Decoration> data;

  /// Widget that will be passed to [DecoratedBox.child]
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
