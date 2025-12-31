import 'package:flutter/material.dart';

/// General-purpose widget extensions.
///
/// These extensions provide miscellaneous utility methods
/// for widgets that don't fit into other categories.
extension WidgetExtensions on Widget {
  /// Wraps the widget with a Tooltip.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.info).tooltip('More information')
  /// ```
  Widget tooltip(String message) {
    return Tooltip(message: message, child: this);
  }

  /// Wraps the widget with Semantics for accessibility.
  ///
  /// ## Example
  ///
  /// ```dart
  /// CustomButton().semanticsLabel('Submit form')
  /// ```
  Widget semanticsLabel(String label) {
    return Semantics(label: label, child: this);
  }

  /// Wraps the widget in a Hero for page transitions.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('photo.jpg').hero('photo_1')
  /// ```
  Widget hero(String tag) {
    return Hero(tag: tag, child: this);
  }

  /// Wraps the widget with a Material widget.
  ///
  /// Useful for ensuring proper ink effects on non-Material widgets.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container().material()
  /// ```
  Widget material({
    MaterialType type = MaterialType.canvas,
    Color? color,
    double elevation = 0,
    BorderRadius? borderRadius,
  }) {
    return Material(
      type: type,
      color: color,
      elevation: elevation,
      borderRadius: borderRadius,
      child: this,
    );
  }

  /// Wraps the widget with RepaintBoundary for performance.
  ///
  /// ## Example
  ///
  /// ```dart
  /// ComplexWidget().repaintBoundary()
  /// ```
  Widget repaintBoundary() {
    return RepaintBoundary(child: this);
  }

  /// Wraps the widget with FittedBox.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Long text').fitted()
  /// ```
  Widget fitted({BoxFit fit = BoxFit.contain}) {
    return FittedBox(fit: fit, child: this);
  }

  /// Wraps the widget with AspectRatio.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('video.jpg').aspectRatio(16 / 9)
  /// ```
  Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  /// Wraps the widget with FractionallySizedBox.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container().fractionalSize(widthFactor: 0.8)
  /// ```
  Widget fractionalSize({double? widthFactor, double? heightFactor}) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }

  /// Wraps the widget with Offstage.
  ///
  /// When offstage, the widget is hidden and doesn't participate
  /// in layout, but its state is preserved.
  ///
  /// ## Example
  ///
  /// ```dart
  /// HeavyWidget().offstage(!isNeeded)
  /// ```
  Widget offstage(bool offstage) {
    return Offstage(offstage: offstage, child: this);
  }

  /// Wraps the widget with LayoutBuilder for responsive layouts.
  ///
  /// ## Example
  ///
  /// ```dart
  /// MyWidget().withLayoutBuilder((context, constraints) {
  ///   print('Width: ${constraints.maxWidth}');
  /// })
  /// ```
  Widget withLayoutBuilder(
    void Function(BuildContext context, BoxConstraints constraints) callback,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        callback(context, constraints);
        return this;
      },
    );
  }

  /// Wraps the widget with a Builder for accessing context.
  ///
  /// ## Example
  ///
  /// ```dart
  /// MyWidget().withBuilder((context) {
  ///   final theme = Theme.of(context);
  ///   // Use theme
  /// })
  /// ```
  Widget withBuilder(void Function(BuildContext context) callback) {
    return Builder(
      builder: (context) {
        callback(context);
        return this;
      },
    );
  }

  /// Wraps the widget with KeyedSubtree for forcing rebuilds.
  ///
  /// ## Example
  ///
  /// ```dart
  /// MyWidget().keyedSubtree(ValueKey('unique_key'))
  /// ```
  Widget keyedSubtree(Key key) {
    return KeyedSubtree(key: key, child: this);
  }

  /// Wraps the widget with DecoratedBox.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').decorated(
  ///   decoration: BoxDecoration(color: Colors.blue),
  /// )
  /// ```
  Widget decorated({
    required Decoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) {
    return DecoratedBox(
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  /// Wraps the widget with Card.
  ///
  /// ## Example
  ///
  /// ```dart
  /// ListTile(...).card()
  /// ```
  Widget card({
    Color? color,
    Color? shadowColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
  }) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      elevation: elevation,
      shape: shape,
      margin: margin,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wraps the widget with InkWell.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(child: Text('Click me')).inkWell(
  ///   onTap: () => print('Tapped!'),
  /// )
  /// ```
  Widget inkWell({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onDoubleTap,
    Color? splashColor,
    Color? highlightColor,
    Color? hoverColor,
    BorderRadius? borderRadius,
  }) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      splashColor: splashColor,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      borderRadius: borderRadius,
      child: this,
    );
  }

  /// Wraps the widget with ExcludeSemantics.
  ///
  /// ## Example
  ///
  /// ```dart
  /// DecorativeIcon().excludeSemantics()
  /// ```
  Widget excludeSemantics([bool excluding = true]) {
    return ExcludeSemantics(excluding: excluding, child: this);
  }

  /// Wraps the widget with Focus for focus management.
  ///
  /// ## Example
  ///
  /// ```dart
  /// TextField().focus(onFocusChange: (hasFocus) => print(hasFocus))
  /// ```
  Widget focus({
    FocusNode? focusNode,
    bool autofocus = false,
    void Function(bool)? onFocusChange,
    bool canRequestFocus = true,
    bool skipTraversal = false,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      onFocusChange: onFocusChange,
      canRequestFocus: canRequestFocus,
      skipTraversal: skipTraversal,
      child: this,
    );
  }

  /// Wraps the widget with CustomPaint.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container().customPaint(painter: MyPainter())
  /// ```
  Widget customPaint({
    CustomPainter? painter,
    CustomPainter? foregroundPainter,
    Size size = Size.zero,
    bool isComplex = false,
    bool willChange = false,
  }) {
    return CustomPaint(
      painter: painter,
      foregroundPainter: foregroundPainter,
      size: size,
      isComplex: isComplex,
      willChange: willChange,
      child: this,
    );
  }

  /// Wraps the widget with ColoredBox for a simple background color.
  ///
  /// More efficient than Container for just a background color.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').coloredBox(Colors.blue)
  /// ```
  Widget coloredBox(Color color) {
    return ColoredBox(color: color, child: this);
  }

  /// Wraps the widget with UnconstrainedBox.
  ///
  /// ## Example
  ///
  /// ```dart
  /// SizedBox(width: 100).unconstrained()
  /// ```
  Widget unconstrained({
    TextDirection? textDirection,
    AlignmentGeometry alignment = Alignment.center,
    Axis? constrainedAxis,
    Clip clipBehavior = Clip.none,
  }) {
    return UnconstrainedBox(
      textDirection: textDirection,
      alignment: alignment,
      constrainedAxis: constrainedAxis,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// Wraps the widget with OverflowBox.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(width: 500).overflowBox(maxWidth: 300)
  /// ```
  Widget overflowBox({
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return OverflowBox(
      alignment: alignment,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      child: this,
    );
  }
}
