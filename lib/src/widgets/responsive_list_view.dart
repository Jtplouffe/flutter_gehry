import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [ListView].
class ResponsiveListView extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<ResponsiveListViewData> data;

  /// Passed to [ListView.custom]
  final SliverChildDelegate childrenDelegate;

  /// Passed to [ListView]
  final ScrollController? controller;

  /// Passed to [ScrollView.primary]
  final bool? primary;

  /// Same as [ListView]
  ResponsiveListView({
    Key? key,
    ResponsiveListViewData? xs,
    ResponsiveListViewData? sm,
    ResponsiveListViewData? md,
    ResponsiveListViewData? lg,
    ResponsiveListViewData? xl,
    this.controller,
    this.primary,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    List<Widget> children = const [],
  })  : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        ),
        super(key: key);

  /// Same as [ListView.builder]
  ResponsiveListView.builder({
    Key? key,
    ResponsiveListViewData? xs,
    ResponsiveListViewData? sm,
    ResponsiveListViewData? md,
    ResponsiveListViewData? lg,
    ResponsiveListViewData? xl,
    this.controller,
    this.primary,
    required IndexedWidgetBuilder itemBuilder,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  })  : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        childrenDelegate = SliverChildBuilderDelegate(
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
    ResponsiveListViewData? xs,
    ResponsiveListViewData? sm,
    ResponsiveListViewData? md,
    ResponsiveListViewData? lg,
    ResponsiveListViewData? xl,
    this.controller,
    this.primary,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  })  : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        childrenDelegate = SliverChildBuilderDelegate(
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
  ResponsiveListView.custom({
    Key? key,
    ResponsiveListViewData? xs,
    ResponsiveListViewData? sm,
    ResponsiveListViewData? md,
    ResponsiveListViewData? lg,
    ResponsiveListViewData? xl,
    this.controller,
    this.primary,
    required this.childrenDelegate,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
  })  : data = BreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final listViewData = data.getForBreakpoint(breakpoint);

    return ListView.custom(
      scrollDirection: listViewData?.scrollDirection ?? ResponsiveListViewData.initial.scrollDirection,
      reverse: listViewData?.reverse ?? ResponsiveListViewData.initial.reverse,
      controller: controller,
      primary: primary,
      physics: listViewData?.physics,
      shrinkWrap: listViewData?.shrinkWrap ?? ResponsiveListViewData.initial.shrinkWrap,
      padding: listViewData?.padding,
      cacheExtent: listViewData?.cacheExtent,
      dragStartBehavior: listViewData?.dragStartBehavior ?? ResponsiveListViewData.initial.dragStartBehavior,
      keyboardDismissBehavior:
          listViewData?.keyboardDismissBehavior ?? ResponsiveListViewData.initial.keyboardDismissBehavior,
      clipBehavior: listViewData?.clipBehavior ?? ResponsiveListViewData.initial.clipBehavior,
      childrenDelegate: childrenDelegate,
    );
  }
}

/// All of this data is provided to [ListView], with a fallback on [initial] if no data is provided for the current breakpoint
class ResponsiveListViewData {
  static const initial = ResponsiveListViewData();

  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual;
  final Clip clipBehavior;

  const ResponsiveListViewData({
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
  });
}
