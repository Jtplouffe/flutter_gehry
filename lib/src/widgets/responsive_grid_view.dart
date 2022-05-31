import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [GridView].
/// If a value is missing and is required by [GridView], the [GridView]`s default constructor's default value will be used.
class ResponsiveGridView extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final BreakpointsData<Axis>? scrollDirection;
  final BreakpointsData<bool>? reverse;
  final BreakpointsData<ScrollPhysics>? physics;
  final BreakpointsData<bool>? shrinkWrap;
  final BreakpointsData<EdgeInsets>? padding;
  final BreakpointsData<DragStartBehavior>? dragStartBehavior;
  final BreakpointsData<ScrollViewKeyboardDismissBehavior>? keyboardDismissBehavior;
  final BreakpointsData<Clip>? clipBehavior;

  /// Passed to [GridView.gridDelegate].
  final SliverGridDelegate gridDelegate;

  /// Passed to [GridView.custom].
  final SliverChildDelegate childrenDelegate;

  /// Passed to [GridView].
  final ScrollController? controller;

  /// Passed to [ScrollView.primary].
  final bool? primary;

  /// Passed to [GridView.cacheExtent].
  final double? cacheExtent;

  /// Passed to [GridView.semanticChildCount].
  final int? semanticChildCount;

  /// Passed to [GridView.restorationId].
  final String? restorationId;

  /// Same as [GridView]
  ResponsiveGridView({
    super.key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    required this.gridDelegate,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    this.cacheExtent,
    List<Widget> children = const [],
    this.semanticChildCount,
    this.dragStartBehavior,
    this.clipBehavior,
    this.keyboardDismissBehavior,
    this.restorationId,
  }) : childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        );

  /// Same as [GridView.builder].
  ResponsiveGridView.builder({
    super.key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    required this.gridDelegate,
    required IndexedWidgetBuilder itemBuilder,
    ChildIndexGetter? findChildIndexCallback,
    int? itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.restorationId,
    this.clipBehavior,
  }) : childrenDelegate = SliverChildBuilderDelegate(
          itemBuilder,
          findChildIndexCallback: findChildIndexCallback,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        );

  ResponsiveGridView.custom({
    super.key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    required this.gridDelegate,
    required this.childrenDelegate,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.restorationId,
    this.clipBehavior,
  });

  ResponsiveGridView.count({
    super.key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    required int crossAxisCount,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    this.cacheExtent,
    List<Widget> children = const <Widget>[],
    this.semanticChildCount,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.restorationId,
    this.clipBehavior,
  })  : gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        );

  ResponsiveGridView.extent({
    super.key,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    required double maxCrossAxisExtent,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    this.cacheExtent,
    List<Widget> children = const <Widget>[],
    this.semanticChildCount,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.restorationId,
    this.clipBehavior,
  })  : gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        childrenDelegate = SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return GridView.custom(
      scrollDirection: scrollDirection?.getForBreakpoint(breakpoint) ?? Axis.vertical,
      reverse: reverse?.getForBreakpoint(breakpoint) ?? false,
      controller: controller,
      primary: primary,
      physics: physics?.getForBreakpoint(breakpoint),
      shrinkWrap: shrinkWrap?.getForBreakpoint(breakpoint) ?? false,
      padding: padding?.getForBreakpoint(breakpoint),
      gridDelegate: gridDelegate,
      childrenDelegate: childrenDelegate,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior?.getForBreakpoint(breakpoint) ?? DragStartBehavior.start,
      keyboardDismissBehavior:
          keyboardDismissBehavior?.getForBreakpoint(breakpoint) ?? ScrollViewKeyboardDismissBehavior.manual,
      restorationId: restorationId,
      clipBehavior: clipBehavior?.getForBreakpoint(breakpoint) ?? Clip.hardEdge,
    );
  }
}
