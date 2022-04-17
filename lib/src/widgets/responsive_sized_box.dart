import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// Wrapper around [SizedBox].
class ResponsiveSizedBox extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<ResponsiveSizedBoxData> data;

  /// Widget tha will be provided to [SizedBox.child].
  final Widget? child;

  ResponsiveSizedBox({
    Key? key,
    ResponsiveSizedBoxData? xs,
    ResponsiveSizedBoxData? sm,
    ResponsiveSizedBoxData? md,
    ResponsiveSizedBoxData? lg,
    ResponsiveSizedBoxData? xl,
    this.child,
  })  : data = ResponsiveBreakpointData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final sizedBoxData = data.getForBreakpoint(breakpoint);

    return SizedBox(
      width: sizedBoxData?.width,
      height: sizedBoxData?.height,
      child: child,
    );
  }
}

class ResponsiveSizedBoxData {
  final double? width;
  final double? height;

  /// Represents [SizedBox].
  const ResponsiveSizedBoxData({
    this.width,
    this.height,
  });

  /// Represents [SizedBox.expand].
  const ResponsiveSizedBoxData.expand()
      : width = double.infinity,
        height = double.infinity;

  /// Represents [SizedBox.shrink].
  const ResponsiveSizedBoxData.shrink()
      : width = 0,
        height = 0;

  /// Represents [SizedBox.fromSize].
  ResponsiveSizedBoxData.fromSize(Size? size)
      : width = size?.width,
        height = size?.height;

  /// Represents [SizedBox.square].
  const ResponsiveSizedBoxData.square(double? dimension)
      : width = dimension,
        height = dimension;
}
