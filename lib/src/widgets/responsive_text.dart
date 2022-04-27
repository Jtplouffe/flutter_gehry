import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Text].
class ResponsiveText extends StatelessWidget with ResponsiveStatelessWidgetMixin {
  final ResponsiveBreakpointsData<ResponsiveTextData> data;

  /// Default text. Can be overridden for the current breakpoint by passing a value to [ResponsiveTextData.text].
  final String text;

  ResponsiveText(
    this.text, {
    Key? key,
    ResponsiveTextData? xs,
    ResponsiveTextData? sm,
    ResponsiveTextData? md,
    ResponsiveTextData? lg,
    ResponsiveTextData? xl,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final textData = data.getForBreakpoint(breakpoint);

    return Text(
      textData?.text ?? text,
      style: textData?.style,
      strutStyle: textData?.strutStyle,
      textAlign: textData?.textAlign,
      textDirection: textData?.textDirection,
      locale: textData?.locale,
      softWrap: textData?.softWrap,
      overflow: textData?.overflow,
      textScaleFactor: textData?.textScaleFactor,
      maxLines: textData?.maxLines,
      semanticsLabel: textData?.semanticsLabel,
      textWidthBasis: textData?.textWidthBasis,
      textHeightBehavior: textData?.textHeightBehavior,
    );
  }
}

/// Data passed to [Text] for the current breakpoint.
class ResponsiveTextData {
  /// Overrides [ResponsiveText.text] for the current breakpoint.
  final String? text;

  /// Passed to [Text.style].
  final TextStyle? style;

  /// Passed to [Text.strutStyle].
  final StrutStyle? strutStyle;

  /// Passed to [Text.textAlign].
  final TextAlign? textAlign;

  /// Passed to [Text.textDirection].
  final TextDirection? textDirection;

  /// Passed to [Text.locale].
  final Locale? locale;

  /// Passed to [Text.softWrap].
  final bool? softWrap;

  /// Passed to [Text.overflow].
  final TextOverflow? overflow;

  /// Passed to [Text.textScaleFactor].
  final double? textScaleFactor;

  /// Passed to [Text.maxLines].
  final int? maxLines;

  /// Passed to [Text.semanticsLabel].
  final String? semanticsLabel;

  /// Passed to [Text.textWidthBasis].
  final TextWidthBasis? textWidthBasis;

  /// Passed to [Text.textHeightBehavior].
  final TextHeightBehavior? textHeightBehavior;

  const ResponsiveTextData({
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
}
