import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Flexible].
class ResponsiveFlexible extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<ResponsiveFlexibleData> data;

  /// Child of the [Flexible].
  final Widget child;

  ResponsiveFlexible({
    super.key,
    ResponsiveFlexibleData? xs,
    ResponsiveFlexibleData? sm,
    ResponsiveFlexibleData? md,
    ResponsiveFlexibleData? lg,
    ResponsiveFlexibleData? xl,
    required this.child,
  }) : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final flexibleData = data.getForBreakpoint(breakpoint);

    return Flexible(
      flex: flexibleData?.flex ?? 1,
      fit: flexibleData?.fit ?? FlexFit.loose,
      child: child,
    );
  }
}

/// Data that will be passed to [Flexible] for the current breakpoint.
class ResponsiveFlexibleData {
  /// Flex value that will be provided to [Flexible.flex].
  final int flex;

  /// [FlexFit] that will be provided to [Flexible.fit].
  final FlexFit fit;

  const ResponsiveFlexibleData({
    required this.flex,
    this.fit = FlexFit.loose,
  });

  /// Doesn't apply any flex.
  const ResponsiveFlexibleData.none()
      : flex = 0,
        fit = FlexFit.loose;
}

class ResponsiveExpandedData extends ResponsiveFlexibleData {
  const ResponsiveExpandedData({super.flex = 1, super.fit = FlexFit.tight});
}
