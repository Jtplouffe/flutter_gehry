import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Mixin for responsive stateless widgets.
///
/// This class provides the [buildResponsive] method, which will automatically rebuilds whenever the current
/// [Breakpoints] changes.
mixin ResponsiveStatelessWidgetMixin on StatelessWidget {
  /// This method should not be overridden, use [buildResponsive] instead.
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpointsProvider.of(context).breakpoint;

    return buildResponsive(context, breakpoint);
  }

  /// Builds with the current [Breakpoints].
  /// This method will be automatically called when the [breakpoint] changes.
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint);
}
