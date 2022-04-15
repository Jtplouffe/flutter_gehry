import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

class ResponsiveBuilder extends BaseResponsiveWidget<Widget> {
  ResponsiveBuilder({
    Key? key,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
    Widget? xxl,
  }) : super(
          key: key,
          sm: sm,
          md: md,
          lg: lg,
          xl: xl,
          xxl: xxl,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint, Widget? data) {
    return data ?? const SizedBox.shrink();
  }
}
