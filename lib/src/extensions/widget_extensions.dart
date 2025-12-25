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
}
