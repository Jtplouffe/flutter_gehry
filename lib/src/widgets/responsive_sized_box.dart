import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [SizedBox].
class ResponsiveSizedBox extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<ResponsiveSizedBoxData> data;

  /// Child of the [SizedBox].
  final Widget? child;

  ResponsiveSizedBox({
    Key? key,
    ResponsiveSizedBoxData? xs,
    ResponsiveSizedBoxData? sm,
    ResponsiveSizedBoxData? md,
    ResponsiveSizedBoxData? lg,
    ResponsiveSizedBoxData? xl,
    this.child,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
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

/// Data that will be passed to [SizedBox] for the current breakpoint.
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
