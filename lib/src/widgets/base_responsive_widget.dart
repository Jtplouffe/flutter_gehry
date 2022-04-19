import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Base widget for responsive widgets.
///
/// This class providers the [buildResponsive] method, which will automatically rebuilds whenever the current
/// [Breakpoints] changes.
abstract class BaseResponsiveWidget extends StatelessWidget {
  const BaseResponsiveWidget({
    Key? key,
  }) : super(key: key);

  /// This method should not be overridden.
  /// Use [buildResponsive] instead, or use [StatelessWidget] or [StatefulWidget].
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
