import 'package:flutter/cupertino.dart';
import 'package:flutter_responsive_layout/src/models/responsive_breakpoints.model.dart';
import 'package:provider/provider.dart';

class ResponsiveBreakpointsProvider extends StatelessWidget {
  final ResponsiveBreakpoints breakpoints;
  final Widget child;

  const ResponsiveBreakpointsProvider({
    Key? key,
    required this.breakpoints,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ResponsiveBreakpoints>.value(
      value: breakpoints,
      child: child,
    );
  }
}
