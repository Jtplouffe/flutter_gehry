import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [ListView].
/// If a value is missing and is required by [ListView], the [ListView]'s default constructor's default value will be used.
class ResponsiveListView extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<Axis>? scrollDirection;
  final BreakpointsData<bool>? reverse;
  final BreakpointsData<ScrollPhysics>? physics;
  final BreakpointsData<bool>? shrinkWrap;
  final BreakpointsData<EdgeInsets>? padding;
  final BreakpointsData<DragStartBehavior>? dragStartBehavior;
  final BreakpointsData<ScrollViewKeyboardDismissBehavior>? keyboardDismissBehavior;
  final BreakpointsData<Clip>? clipBehavior;

  /// Passed to [ListView.custom].
  final SliverChildDelegate childrenDelegate;

  /// Passed to [ListView].
  final ScrollController? controller;

  /// Passed to [ScrollView.primary].
  final bool? primary;

  /// Passed to [ListView.cacheExtent].
  final double? cacheExtent;

  /// Same as [ListView]
  ResponsiveListView({
    Key? key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.cacheExtent,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.clipBehavior,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    List<Widget> children = const [],
  })  : childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(key: key);

  /// Same as [ListView.builder]
  ResponsiveListView.builder({
    Key? key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.cacheExtent,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.clipBehavior,
    required IndexedWidgetBuilder itemBuilder,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  })  : childrenDelegate = SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(key: key);

  /// Same as [ListView.separated]
  ResponsiveListView.separated({
    Key? key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.cacheExtent,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.clipBehavior,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  })  : childrenDelegate = SliverChildBuilderDelegate(
          (context, index) {
            final int itemIndex = index ~/ 2;
            if (index.isEven) return itemBuilder(context, itemIndex);
            return separatorBuilder(context, itemIndex);
          },
          childCount: math.max(0, itemCount * 2 - 1),
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(key: key);

  /// Same as [ListView.custom]
  const ResponsiveListView.custom({
    Key? key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.cacheExtent,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.clipBehavior,
    required this.childrenDelegate,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  }) : super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return ListView.custom(
      scrollDirection: scrollDirection?.getForBreakpoint(breakpoint) ?? Axis.vertical,
      reverse: reverse?.getForBreakpoint(breakpoint) ?? false,
      controller: controller,
      primary: primary,
      physics: physics?.getForBreakpoint(breakpoint),
      shrinkWrap: shrinkWrap?.getForBreakpoint(breakpoint) ?? false,
      padding: padding?.getForBreakpoint(breakpoint),
      cacheExtent: cacheExtent,
      dragStartBehavior: dragStartBehavior?.getForBreakpoint(breakpoint) ?? DragStartBehavior.start,
      keyboardDismissBehavior:
          keyboardDismissBehavior?.getForBreakpoint(breakpoint) ?? ScrollViewKeyboardDismissBehavior.manual,
      clipBehavior: clipBehavior?.getForBreakpoint(breakpoint) ?? Clip.hardEdge,
      childrenDelegate: childrenDelegate,
    );
  }
}
