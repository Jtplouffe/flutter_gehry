import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// This widget provides the [ResponsiveBreakpoints] to his [child].
/// It also provides the current [Breakpoints] via an [InheritedWidget], which will rebuild widget that depend on it
/// whenever the current [Breakpoints] changes.
///
/// This widget should ideally be placed at the top of the widget tree.
class ResponsiveBreakpointsProvider extends StatelessWidget {
  /// Breakpoints at which the current [Breakpoints] will change.
  final ResponsiveBreakpoints breakpoints;

  /// Child which will be able to access the current [Breakpoints].
  final Widget child;

  const ResponsiveBreakpointsProvider({
    Key? key,
    this.breakpoints = const ResponsiveBreakpoints(),
    required this.child,
  }) : super(key: key);

  /// Returns [ResponsiveBreakpointProviderScope] from context and depend on it.
  static ResponsiveBreakpointProviderScope of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<ResponsiveBreakpointProviderScope>();
    if (data == null) {
      throw Exception("Could not find inherited widget of type ResponsiveBreakpointProviderData");
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      // If no mediaQuery is found (eg. if this widget is used before `MaterialApp`).
      return MediaQuery.fromWindow(
        child: Builder(
          builder: (context) => ResponsiveBreakpointProviderScope(
            breakpoints: breakpoints,
            breakpoint: breakpoints.getCurrentBreakpoint(context),
            child: child,
          ),
        ),
      );
    }

    return ResponsiveBreakpointProviderScope(
      breakpoints: breakpoints,
      breakpoint: breakpoints.getCurrentBreakpoint(context),
      child: child,
    );
  }
}

/// Data that will be provided in the context
class ResponsiveBreakpointProviderScope extends InheritedWidget {
  /// [ResponsiveBreakpoints] that will be used to determine the [breakpoint].
  final ResponsiveBreakpoints breakpoints;

  /// Current [Breakpoints].
  final Breakpoints breakpoint;

  const ResponsiveBreakpointProviderScope({
    Key? key,
    required this.breakpoints,
    required this.breakpoint,
    required Widget child,
  }) : super(key: key, child: child);

  /// Only notify when the [breakpoints] or the [breakpoint] changes. This helps a lot with performance, since we are
  /// only rebuilding widgets when the [breakpoint] changes, and not whenever the window's width changes.
  @override
  bool updateShouldNotify(covariant ResponsiveBreakpointProviderScope oldWidget) {
    return breakpoints != oldWidget.breakpoints || breakpoint != oldWidget.breakpoint;
  }

  /// Returns some value for the current breakpoint.
  /// Returns null if no data matches the current breakpoint.
  D? maybePick<D>({D? xs, D? sm, D? md, D? lg, D? xl}) {
    return ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl).getForBreakpoint(breakpoint);
  }

  /// Same as [maybePick], but with the [xs] required, so it never returns null.
  D pick<D>({required D xs, D? sm, D? md, D? lg, D? xl}) {
    return ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl).getForBreakpoint(breakpoint)!;
  }
}
