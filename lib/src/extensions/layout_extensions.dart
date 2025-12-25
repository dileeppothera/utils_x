import 'package:flutter/material.dart';

/// Extensions for layout and positioning of widgets.
///
/// These extensions provide convenient methods for common layout
/// operations like padding, centering, alignment, and more.
extension LayoutExtensions on Widget {
  /// Adds padding to all sides of the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').padding(16)
  /// ```
  Widget padding(double all) {
    return Padding(padding: EdgeInsets.all(all), child: this);
  }

  /// Adds custom padding to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').paddingOnly(left: 8, top: 16)
  /// ```
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').paddingSymmetric(horizontal: 16, vertical: 8)
  /// ```
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Adds horizontal padding to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').paddingH(16)
  /// ```
  Widget paddingH(double horizontal) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: this,
    );
  }

  /// Adds vertical padding to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').paddingV(8)
  /// ```
  Widget paddingV(double vertical) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: this,
    );
  }

  /// Centers the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').centered()
  /// ```
  Widget centered() {
    return Center(child: this);
  }

  /// Aligns the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').align(Alignment.topRight)
  /// ```
  Widget align(Alignment alignment) {
    return Align(alignment: alignment, child: this);
  }

  /// Wraps the widget with Expanded.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').expanded()
  /// ```
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Wraps the widget with Flexible.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').flexible()
  /// ```
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  /// Wraps the widget with SizedBox for fixed dimensions.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container().size(width: 100, height: 50)
  /// ```
  Widget size({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }

  /// Wraps the widget with SizedBox for square dimensions.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.star).square(48)
  /// ```
  Widget square(double size) {
    return SizedBox(width: size, height: size, child: this);
  }

  /// Wraps the widget with SliverToBoxAdapter.
  ///
  /// Useful when you need to use a box widget inside a CustomScrollView.
  ///
  /// ## Example
  ///
  /// ```dart
  /// CustomScrollView(
  ///   slivers: [
  ///     Text('Header').sliverBox(),
  ///     SliverList(...),
  ///   ],
  /// )
  /// ```
  Widget sliverBox() {
    return SliverToBoxAdapter(child: this);
  }

  /// Wraps the widget with SafeArea.
  ///
  /// ## Example
  ///
  /// ```dart
  /// MyScreen().safeArea()
  /// ```
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  /// Adds margin around the widget using Container.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Card().margin(16)
  /// ```
  Widget margin(double all) {
    return Container(margin: EdgeInsets.all(all), child: this);
  }

  /// Adds symmetric margin around the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Card().marginSymmetric(horizontal: 16, vertical: 8)
  /// ```
  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Constrains the widget's dimensions.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').constrained(maxWidth: 200)
  /// ```
  Widget constrained({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: this,
    );
  }

  /// Makes the widget take up full available width.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Button('Submit').fullWidth()
  /// ```
  Widget fullWidth() {
    return SizedBox(width: double.infinity, child: this);
  }
}
