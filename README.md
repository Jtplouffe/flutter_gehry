# flutter_gehry

A Flutter package that provides a way to do a responsive layout. This package uses a mobile-first
breakpoint approach.

<br />

### Table of content

1. [Usage](#usage)
2. [Responsive widgets](#responsive-widgets)
    1. [ResponsiveBuilder](#responsivebuilder)
    2. [ResponsiveConstrainedBox](#responsiveconstrainedbox)
    3. [ResponsiveDecoratedBox](#responsivedecoratedbox)
    4. [ResponsiveFlex](#responsiveflex)
    5. [ResponsiveFlexible](#responsiveflexible)
    6. [ResponsiveListView](#responsivelistview)
    7. [ResponsivePadding](#responsivepadding)
    8. [ResponsiveSizedBox](#responsivesizedbox)
    9. [ResponsiveText](#responsivetext)
    10. [ResponsiveWidget](#responsivewidget)

## Usage

In order to use this package, you must wrap your app with `ResponsiveBreakpointsProvider`.

Example:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpointsProvider(
      child: MaterialApp(
        title: "Responsive app",
        home: Text("Home"),
      ),
    );
  }
}
```

This will provide the different breakpoints to the app. The breakpoints works be minimum window
width.

There are 5 breakpoints: `xs`, `sm`, `md`, `lg`, and `xl`.

The defaults values for those breakpoints are:

- xs: `0` (cannot be configured)
- sm: `640`
- md: `768`
- lg: `1024`
- xl: `1280`

These can be changed by passing an instance of `ResponsiveBreakpoints` to the `breakpoints` property
of `ResponsiveBreakpointsProvider`.

Widgets that depend on `ResponsiveBreakpointsProvider` will only be rebuilt when the current
breakpoint change, instead of whenever the window size changes.

<br />

If you need some arbitrary value depending on the current breakpoint, you can use
`ResponsiveBreakpointsProvider.of(context).maybePick(...)`
or `ResponsiveBreakpointsProvider.of(context).pick(...)`.
The difference between both is that `pick` must be provided the `xs` value, whereas the `maybePick`
will just return `null` of no data matches the current breakpoint.

For example, if you want as string to change depending on the breakpoint:
```dart
const value = ResponsiveBreakpointsProvider.of(context).pick(
  xs: "This string will be returned on the xs and sm breakpoint",
  md: "This string will be returned on the md and lg breakpoint",
  xl: "This string will be returned on the xl breakpoint",
);
```

<br />

## Responsive widgets

Multiple widgets are provided by the package. Do you think there is a widget missing? Open an issue
and I will look at it!

Responsive widgets all extends `BaseResponsiveWidget`, which provides the `buildResponsive` method,
that will be called with a `BuildContext` and the current `Breakpoints` to build the widget.

Responsive widgets usually takes a data for each breakpoint. This package is mobile-first, meaning
that if no data has been provided for the current breakpoint, the data of the next smaller non-null
breakpoint will be used.

For example, if the following data is provided to `ResponsivePadding`:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      sm: const EdgeInsets.all(12),
      xl: const EdgeInsets.all(32),
      child: const Text("Responsive padding"),
    );
  }
}
```

In this example, if the current breakpoint is `md`, since we did not provide an `EdgeInsets` for
the `md` breakpoint, the value of the `sm` breakpoint will be used. If we hadn't provided a value
for the `sm` breakpoint, the child would have been used without adding any padding.

<br />

### ResponsiveBuilder

Same as `ResponsiveWidget`, but with `WidgetBuilder`, which is
a `Widget Function(BuildContext context)` instead of a `Widget`.

Usage:
```dart
ResponsiveBuilder(
  xs: (context) => const Text("This will be displayed on xs, sm and md breakpoint"),
  lg: (context) => const Text("This will be displayed on lg and xl breakpoint"),
);
```

<br />

### ResponsiveConstrainedBox

This widget is a wrapper around the `ConstrainedBox` widget.

If no constraints has been provided for the current breakpoint, the child will be directly returned.
If the child is also null, a `SizedBox.shrink()` will be used.

Usage:
```dart
ResponsiveConstrainedBox(
  xs: const BoxConstraints.tightFor(width: 100),
  lg: const BoxConstraints.tightFor(width: 200),
  child: const Text("This text will be constrained depending on the breakpoint"),
);
```

<br />

### ResponsiveDecoratedBox

This widget is a wrapper around the `DecoratedBox` widget.

If there is no data for the current breakpoint, the child will be directly returned. If the child is
null, a `SizedBox.shrink()` will be used.

Usage:
```dart
ResponsiveDecoratedBox(
  xs: const BoxDecoration(color: Colors.red),
  xs: const BoxDecoration(color: Colors.blue),
  child: const Text("The background color will change depending on the breakpoint"),
);
```

<br />

### ResponsiveFlex

This widget is a wrapper around the `Flex` widget, which is the base widget of both `Row`
and `column`. This can be used to display a list of widget with a different direction, depending on
the current breakpoint.

For each values, this widget takes a `BreakpointsData`, and falls back to `Flex`'s default values.

Usage:
```dart
ResponsiveFlex(
  direction: const BreakpointsData(
    xs: Axis.vertical,
    lg: Axis.horizontal,
  ),
  children: const [
    Text("The children will be displayed vertically (Column) on the xs, sm and md breakpoint"),
    Text("The children will be displayed horizontally (Row) on the lg and xl breakpoint"),
  ],
);
```

<br />

### ResponsiveFlexible

This widget is a wrapper around the `Flexible` widget, and should only be used as the child of
a `Flex` widget.

This widget takes an instance of `ResponsiveFlexibleData` for each breakpoint.
The `ResponsiveFlexibleData` represents the `Flexible` widget, and `ResponsiveExpandedData`, which
extends `ResponsiveFlexibleData`, represents the `Expanded` widget.

If there is no data for the current breakpoint, a `SizedBox.shrink()` will be returned.

<br />

### ResponsiveListView

This widget is a wrapper around the `ListView` widget.

<br />

### ResponsivePadding

This widget is a wrapper around the `Padding` widget.

This widget takes an instance of `EdgeInsets` for each breakpoint.

If there is no data for the current breakpoint, the child will be directly returned, without any
padding.

Usage:
```dart
ResponsivePadding(
  xs: const EdgeInsets.all(8),
  md: const EdgeInsets.all(24),
  lg: const EdgeInsets.all(42),
  child: Text("This text will have more padding the greater the breakpoint is"),
);
```

<br />

### ResponsiveSizedBox

This widget is a wrapper around the `SizedBox` widget.

This widget takes an instance of `ResponsiveSizedBoxData` for each breakpoint.

If there is no data for the current breakpoint, a `SizedBox` with no width and no height will be
returned.

Usage:
```dart
ResponsiveSizedBox(
  xs: const ResponsiveSizedBoxData(height: 20),
  md: const ResponsiveSizedBoxData(height: 32),
  xl: const ResponsiveSizedBoxData(height: 52),
  child: Text("The SizedBox will take more vertical space the greater the breakpoint is"),
);
```

<br />

### ResponsiveText

This widget is a wrapper around the `Text` widget.

Just like the normal `Text` widget, the first argument must be a `String`. The rest of the arguments
arguments must be provided via the breakpoints with a `ResponsiveTextData`. By passing a `text`
to `ResponsiveTextData`, it will override the `text` passed to the widget for the current
breakpoint.

Usage:
```dart
ResponsiveText(
  "This is the text that will be displayed",
  xs: const ResponsiveTextData(
    style: TextStyle(fontSize: 12),
  ),
  md: const ResponsiveTextData(
    style: TextStyle(fontSize: 16),
  ),
  xl: const ResponsiveTextData(
    style: TextStyle(fontSize: 20),
    text: "This text will override the default text on the xl breakpoint",
  ),
);
```

<br />

### ResponsiveWidget

This is a simple widget that takes a `Widget` for each breakpoint and returns the widget for the
current breakpoint.

If there is no data for the current breakpoint, a `SizedBox.shrink()` will be returned.

Usage:
```dart
ResponsiveWidget(
  xs: const SizedBox.square(dimension: 12),
  md: const Text("This Text widget will be displayed on the md and lg breakpoint"),
  xl: const Center(
    child: Text("This Text widget will be displayed on the xl breakpoint"),
  ),
);
```
