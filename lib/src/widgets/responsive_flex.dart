import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// Wrapper around [Flex].
/// For a [Row], use [ResponsiveBreakpointData.horizontal] and for a [Column] use [ResponsiveBreakpointData.vertical]
class ResponsiveFlex extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<ResponsiveFlexData> data;

  /// List of widget that will be passed to [Row.children] or [Column.children], depending on the current breakpoint
  final List<Widget> children;

  ResponsiveFlex({
    Key? key,
    ResponsiveFlexData? sm,
    ResponsiveFlexData? md,
    ResponsiveFlexData? lg,
    ResponsiveFlexData? xl,
    ResponsiveFlexData? xxl,
    required this.children,
  })  : data = ResponsiveBreakpointData(sm: sm, md: md, lg: lg, xl: xl, xxl: xxl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final data = this.data.getForBreakpoint(breakpoint);

    if (data == null) return const SizedBox.shrink();

    return Flex(
      direction: data.direction,
      mainAxisAlignment: data.mainAxisAlignment,
      mainAxisSize: data.mainAxisSize,
      crossAxisAlignment: data.crossAxisAlignment,
      textDirection: data.textDirection,
      verticalDirection: data.verticalDirection,
      textBaseline: data.textBaseline,
      clipBehavior: data.clipBehavior,
      children: children,
    );
  }
}

class ResponsiveFlexData {
  /// Direction of the children, will be provided to [Flex.direction].
  final Axis direction;

  /// [MainAxisAlignment] that will be provided to [Flex.mainAxisAlignment].
  final MainAxisAlignment mainAxisAlignment;

  /// [MainAxisSize] that will be provided to [Flex.mainAxisSize].
  final MainAxisSize mainAxisSize;

  /// [CrossAxisAlignment] that will be provided to [Flex.crossAxisAlignment].
  final CrossAxisAlignment crossAxisAlignment;

  /// [TextDirection] that will be provided to [Flex.textDirection].
  final TextDirection? textDirection;

  /// [VerticalDirection] that will be provided to [Flex.verticalDirection].
  final VerticalDirection verticalDirection;

  /// [TextBaseline] that will be provided to [Flex.textBaseline].
  final TextBaseline? textBaseline;

  /// [Clip] that will be provided to [Flex.clipBehavior].
  final Clip clipBehavior;

  const ResponsiveFlexData({
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  });

  const ResponsiveFlexData.horizontal({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  }) : direction = Axis.horizontal;

  const ResponsiveFlexData.vertical({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  }) : direction = Axis.vertical;
}
