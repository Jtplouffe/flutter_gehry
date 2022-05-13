import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Text].
class ResponsiveText extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  /// Default text. Can be overridden for the current breakpoint by passing a value to [text].
  final String defaultText;

  /// Overrides [defaultText] for the current breakpoint.
  final BreakpointsData<String>? text;

  /// Passed to [Text.style].
  final BreakpointsData<TextStyle>? style;

  /// Passed to [Text.strutStyle].
  final BreakpointsData<StrutStyle>? strutStyle;

  /// Passed to [Text.textAlign].
  final BreakpointsData<TextAlign>? textAlign;

  /// Passed to [Text.textDirection].
  final BreakpointsData<TextDirection>? textDirection;

  /// Passed to [Text.locale].
  final BreakpointsData<Locale>? locale;

  /// Passed to [Text.softWrap].
  final BreakpointsData<bool>? softWrap;

  /// Passed to [Text.overflow].
  final BreakpointsData<TextOverflow>? overflow;

  /// Passed to [Text.textScaleFactor].
  final BreakpointsData<double>? textScaleFactor;

  /// Passed to [Text.maxLines].
  final BreakpointsData<int>? maxLines;

  /// Passed to [Text.semanticsLabel].
  final BreakpointsData<String>? semanticsLabel;

  /// Passed to [Text.textWidthBasis].
  final BreakpointsData<TextWidthBasis>? textWidthBasis;

  /// Passed to [Text.textHeightBehavior].
  final BreakpointsData<TextHeightBehavior>? textHeightBehavior;

  const ResponsiveText(
    this.defaultText, {
    super.key,
    this.text,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    return Text(
      text?.getForBreakpoint(breakpoint) ?? defaultText,
      style: style?.getForBreakpoint(breakpoint),
      strutStyle: strutStyle?.getForBreakpoint(breakpoint),
      textAlign: textAlign?.getForBreakpoint(breakpoint),
      textDirection: textDirection?.getForBreakpoint(breakpoint),
      locale: locale?.getForBreakpoint(breakpoint),
      softWrap: softWrap?.getForBreakpoint(breakpoint),
      overflow: overflow?.getForBreakpoint(breakpoint),
      textScaleFactor: textScaleFactor?.getForBreakpoint(breakpoint),
      maxLines: maxLines?.getForBreakpoint(breakpoint),
      semanticsLabel: semanticsLabel?.getForBreakpoint(breakpoint),
      textWidthBasis: textWidthBasis?.getForBreakpoint(breakpoint),
      textHeightBehavior: textHeightBehavior?.getForBreakpoint(breakpoint),
    );
  }
}
