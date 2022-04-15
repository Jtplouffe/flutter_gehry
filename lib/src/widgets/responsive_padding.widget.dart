import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

class ResponsivePadding extends BaseResponsiveWidget<EdgeInsets> {
  final Widget child;

  ResponsivePadding({
    Key? key,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    EdgeInsets? xxl,
    required this.child,
  }) : super(
          key: key,
          sm: sm,
          md: md,
          lg: lg,
          xl: xl,
          xxl: xxl,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint, EdgeInsets? data) {
    if (data == null) return child;

    return Padding(
      padding: data,
      child: child,
    );
  }
}
