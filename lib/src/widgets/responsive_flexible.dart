import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Flexible].
class ResponsiveFlexible extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<ResponsiveFlexibleData> data;
  final Widget child;

  ResponsiveFlexible({
    Key? key,
    ResponsiveFlexibleData? xs,
    ResponsiveFlexibleData? sm,
    ResponsiveFlexibleData? md,
    ResponsiveFlexibleData? lg,
    ResponsiveFlexibleData? xl,
    required this.child,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final flexibleData = data.getForBreakpoint(breakpoint);
    if (flexibleData == null) return child;

    return Flexible(
      flex: flexibleData.flex,
      fit: flexibleData.fit,
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
  const ResponsiveExpandedData({int flex = 1})
      : super(
          flex: flex,
          fit: FlexFit.tight,
        );
}
