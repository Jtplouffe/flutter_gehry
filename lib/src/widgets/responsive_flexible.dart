import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// Wrapper around [Flexible].
class ResponsiveFlexible extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<ResponsiveFlexibleData> data;
  final Widget child;

  ResponsiveFlexible({
    Key? key,
    ResponsiveFlexibleData? sm,
    ResponsiveFlexibleData? md,
    ResponsiveFlexibleData? lg,
    ResponsiveFlexibleData? xl,
    ResponsiveFlexibleData? xxl,
    required this.child,
  })  : data = ResponsiveBreakpointData(sm: sm, md: md, lg: lg, xl: xl, xxl: xxl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final data = this.data.getForBreakpoint(breakpoint);
    if (data == null) return child;

    return Flexible(
      flex: data.flex,
      fit: data.fit,
      child: child,
    );
  }
}

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
  const ResponsiveExpandedData({int flex = 1})
      : super(
          flex: flex,
          fit: FlexFit.tight,
        );
}
