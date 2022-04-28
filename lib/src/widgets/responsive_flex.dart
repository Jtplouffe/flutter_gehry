import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Flex].
/// If a value has not been provided, falls back on the [Flex] default constructor's values.
class ResponsiveFlex extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  /// Direction of the children, will be provided to [Flex.direction]. Defaults to [Axis.vertical] on null.
  final BreakpointsData<Axis> direction;

  /// [MainAxisAlignment] that will be provided to [Flex.mainAxisAlignment]. Defaults to [MainAxisAlignment.start].
  final BreakpointsData<MainAxisAlignment>? mainAxisAlignment;

  /// [MainAxisSize] that will be provided to [Flex.mainAxisSize]. Defaults to [MainAxisSize.max].
  final BreakpointsData<MainAxisSize>? mainAxisSize;

  /// [CrossAxisAlignment] that will be provided to [Flex.crossAxisAlignment]. Defaults to [CrossAxisAlignment.center].
  final BreakpointsData<CrossAxisAlignment>? crossAxisAlignment;

  /// [TextDirection] that will be provided to [Flex.textDirection].
  final BreakpointsData<TextDirection>? textDirection;

  /// [VerticalDirection] that will be provided to [Flex.verticalDirection]. Defaults to [VerticalDirection.down].
  final BreakpointsData<VerticalDirection>? verticalDirection;

  /// [TextBaseline] that will be provided to [Flex.textBaseline].
  final BreakpointsData<TextBaseline>? textBaseLine;

  /// [Clip] that will be provided to [Flex.clipBehavior]. Defaults to [Clip.none].
  final BreakpointsData<Clip>? clipBehavior;

  /// List of widget that will be passed to [Flex.children].
  final List<Widget> children;

  ResponsiveFlex({
    Key? key,
    required this.direction,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseLine,
    this.clipBehavior,
    required this.children,
  }) : super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return Flex(
      direction: direction.getForBreakpoint(breakpoint) ?? Axis.vertical,
      mainAxisAlignment: mainAxisAlignment?.getForBreakpoint(breakpoint) ?? MainAxisAlignment.start,
      mainAxisSize: mainAxisSize?.getForBreakpoint(breakpoint) ?? MainAxisSize.max,
      crossAxisAlignment: crossAxisAlignment?.getForBreakpoint(breakpoint) ?? CrossAxisAlignment.center,
      textDirection: textDirection?.getForBreakpoint(breakpoint),
      verticalDirection: verticalDirection?.getForBreakpoint(breakpoint) ?? VerticalDirection.down,
      textBaseline: textBaseLine?.getForBreakpoint(breakpoint),
      clipBehavior: clipBehavior?.getForBreakpoint(breakpoint) ?? Clip.none,
      children: children,
    );
  }
}
