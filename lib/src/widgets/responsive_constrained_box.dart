import 'package:flutter/cupertino.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [ConstrainedBox].
///
/// If no [BoxConstraints] has been provided for the current breakpoint, the child will be directly returned, without any [ConstrainedBox].
/// If [child] is also null, a [SizedBox.shrink] will be returned.
class ResponsiveConstrainedBox extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<BoxConstraints> data;

  /// Child of the [ConstrainedBox].
  final Widget? child;

  ResponsiveConstrainedBox({
    Key? key,
    BoxConstraints? xs,
    BoxConstraints? sm,
    BoxConstraints? md,
    BoxConstraints? lg,
    BoxConstraints? xl,
    required this.child,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final constraints = data.getForBreakpoint(breakpoint);
    if (constraints == null) return child ?? const SizedBox.shrink();

    return ConstrainedBox(
      constraints: constraints,
      child: child,
    );
  }
}
