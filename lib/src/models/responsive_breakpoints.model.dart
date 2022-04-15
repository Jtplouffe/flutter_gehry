import 'package:flutter/cupertino.dart';
import 'package:flutter_responsive_layout/src/enums/breakpoints.enum.dart';
import 'package:provider/provider.dart';

class ResponsiveBreakpoints {
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  const ResponsiveBreakpoints({
    this.md = 767,
    this.lg = 1023,
    this.xl = 1279,
    this.xxl = 1535,
  }) : assert(0 < md && md < lg && lg < xl && xl < xxl);

  factory ResponsiveBreakpoints.of(BuildContext context, {bool listen = true}) => Provider.of(context, listen: listen);

  Breakpoints getCurrentBreakpoint(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < md) return Breakpoints.sm;
    if (width < lg) return Breakpoints.md;
    if (width < xl) return Breakpoints.lg;
    if (width < xxl) return Breakpoints.xl;
    return Breakpoints.xxl;
  }
}
