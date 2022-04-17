import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// This widget providers the [ResponsiveBreakpoints] to its [child].
/// It also provides the current [Breakpoints] via an [InheritedWidget], which will rebuild widget that depend on it
/// whenever the current [Breakpoints] changes
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

  /// Returns [ResponsiveBreakpointProviderData] from context and depend on it.
  static ResponsiveBreakpointProviderData of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<ResponsiveBreakpointProviderData>();
    if (data == null) {
      throw Exception("Could not find inherited widget of type ResponsiveBreakpointProviderData");
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      // If no mediaQuery is found (ig. if this widget is used before [MaterialApp]).
      return MediaQuery.fromWindow(
        child: Builder(
          builder: (context) => ResponsiveBreakpointProviderData(
            breakpoints: breakpoints,
            breakpoint: breakpoints.getCurrentBreakpoint(context),
            child: child,
          ),
        ),
      );
    }

    return ResponsiveBreakpointProviderData(
      breakpoints: breakpoints,
      breakpoint: breakpoints.getCurrentBreakpoint(context),
      child: child,
    );
  }
}

/// Data that will be provided in the context
class ResponsiveBreakpointProviderData extends InheritedWidget {
  /// [ResponsiveBreakpoints] that will be used to determine the [breakpoint]
  final ResponsiveBreakpoints breakpoints;

  /// Current [Breakpoints]
  final Breakpoints breakpoint;

  const ResponsiveBreakpointProviderData({
    Key? key,
    required this.breakpoints,
    required this.breakpoint,
    required Widget child,
  }) : super(key: key, child: child);

  /// Only notify when the [breakpoints] or the [breakpoint] changes. This helps a lot with performance, since we are
  /// only rebuilding widgets when the [breakpoint] changes, and not when the window width changes.
  @override
  bool updateShouldNotify(covariant ResponsiveBreakpointProviderData oldWidget) {
    return breakpoints != oldWidget.breakpoints || breakpoint != oldWidget.breakpoint;
  }
}
