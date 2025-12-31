import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/shimmer_widget.dart';

/// Extensions for styling widgets.
///
/// These extensions provide convenient methods for common styling
/// operations like borders, shadows, opacity, transforms, and effects.
extension StylingExtensions on Widget {
  /// Clips the widget with rounded corners.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('photo.jpg').rounded(12)
  /// ```
  Widget rounded(double radius) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  }

  /// Clips the widget with custom border radius.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container().roundedOnly(topLeft: 12, topRight: 12)
  /// ```
  Widget roundedOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: this,
    );
  }

  /// Clips the widget to a circle.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('avatar.jpg').circular()
  /// ```
  Widget circular() {
    return ClipOval(child: this);
  }

  /// Adds a box shadow to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Card().withShadow()
  /// Card().withShadow(color: Colors.blue.withOpacity(0.2), blur: 20)
  /// ```
  Widget withShadow({
    Color color = Colors.black26,
    double blur = 10,
    double spreadRadius = 0,
    Offset offset = const Offset(0, 4),
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blur,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
      child: this,
    );
  }

  /// Sets the opacity of the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Faded').opacity(0.5)
  /// ```
  Widget opacity(double opacity) {
    return Opacity(opacity: opacity, child: this);
  }

  /// Rotates the widget by degrees.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.arrow).rotate(45)
  /// ```
  Widget rotate(double degrees) {
    return Transform.rotate(
      angle: degrees * (3.14159265359 / 180), // Convert to radians
      child: this,
    );
  }

  /// Scales the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.star).scale(1.5)
  /// ```
  Widget scale(double scale) {
    return Transform.scale(scale: scale, child: this);
  }

  /// Translates (moves) the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.star).translate(x: 10, y: 5)
  /// ```
  Widget translate({double x = 0, double y = 0}) {
    return Transform.translate(offset: Offset(x, y), child: this);
  }

  /// Flips the widget horizontally.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.arrow_forward).flipH()
  /// ```
  Widget flipH() {
    return Transform.flip(flipX: true, child: this);
  }

  /// Flips the widget vertically.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Icon(Icons.arrow_up).flipV()
  /// ```
  Widget flipV() {
    return Transform.flip(flipY: true, child: this);
  }

  /// Adds a blur effect behind the widget (glassmorphism).
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   color: Colors.white.withOpacity(0.1),
  ///   child: Text('Frosted'),
  /// ).blur(10)
  /// ```
  Widget blur(double sigma) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: this,
      ),
    );
  }

  /// Adds a colored overlay to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('photo.jpg').colorOverlay(Colors.black54)
  /// ```
  Widget colorOverlay(Color color) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
      child: this,
    );
  }

  /// Adds a border to the widget using DecoratedBox.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Bordered').withBorder(color: Colors.blue)
  /// ```
  Widget withBorder({
    Color color = Colors.grey,
    double width = 1,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
        borderRadius: borderRadius,
      ),
      child: this,
    );
  }

  /// Adds a gradient background to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Gradient').withGradient(
  ///   colors: [Colors.blue, Colors.purple],
  /// )
  /// ```
  Widget withGradient({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(colors: colors, begin: begin, end: end),
      ),
      child: this,
    );
  }

  /// Adds a glow effect to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container().glow(color: Colors.blue)
  /// ```
  Widget glow({
    Color color = Colors.blue,
    double blur = 20,
    double spreadRadius = 1,
    double opacity = 0.5,
    BorderRadius? borderRadius,
  }) {
    return withShadow(
      color: color.withValues(alpha: opacity),
      blur: blur,
      spreadRadius: spreadRadius,
      offset: Offset.zero,
      borderRadius: borderRadius,
    );
  }

  /// Adds a background color to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Hello').withBackground(Colors.blue)
  /// ```
  Widget withBackground(Color color, {BorderRadius? borderRadius}) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: this,
    );
  }

  /// Creates a glassmorphism (frosted glass) effect.
  ///
  /// Combines blur, transparency, and optional border for a modern glass UI.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   child: Text('Frosted Card'),
  /// ).glassmorphism()
  /// ```
  Widget glassmorphism({
    double blur = 10,
    double opacity = 0.1,
    Color color = Colors.white,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    Color? borderColor,
    double borderWidth = 1,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: color.withValues(alpha: opacity),
            borderRadius: borderRadius,
            border: borderColor != null
                ? Border.all(color: borderColor, width: borderWidth)
                : Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: borderWidth,
                  ),
          ),
          child: this,
        ),
      ),
    );
  }

  /// Adds a shimmer loading effect to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   width: 200,
  ///   height: 50,
  ///   color: Colors.grey[300],
  /// ).shimmer()
  /// ```
  Widget shimmer({
    Color baseColor = const Color(0xFFE0E0E0),
    Color highlightColor = const Color(0xFFF5F5F5),
    Duration duration = const Duration(milliseconds: 1500),
    ShimmerDirection direction = ShimmerDirection.leftToRight,
    bool enabled = true,
  }) {
    return ShimmerWidget(
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
      direction: direction,
      enabled: enabled,
      child: this,
    );
  }

  /// Creates a neumorphism (soft UI) effect.
  ///
  /// Adds soft shadows that create an embossed or debossed appearance.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   padding: EdgeInsets.all(20),
  ///   child: Icon(Icons.star),
  /// ).neumorphism()
  /// ```
  Widget neumorphism({
    Color backgroundColor = const Color(0xFFE0E5EC),
    double intensity = 0.5,
    double blur = 15,
    double distance = 5,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    bool isPressed = false,
  }) {
    final lightShadow = Colors.white.withValues(alpha: intensity);
    final darkShadow = Colors.black.withValues(alpha: intensity * 0.3);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: isPressed
            ? [
                BoxShadow(
                  color: darkShadow,
                  offset: Offset(-distance / 2, -distance / 2),
                  blurRadius: blur / 2,
                ),
                BoxShadow(
                  color: lightShadow,
                  offset: Offset(distance / 2, distance / 2),
                  blurRadius: blur / 2,
                ),
              ]
            : [
                BoxShadow(
                  color: lightShadow,
                  offset: Offset(-distance, -distance),
                  blurRadius: blur,
                ),
                BoxShadow(
                  color: darkShadow,
                  offset: Offset(distance, distance),
                  blurRadius: blur,
                ),
              ],
      ),
      child: this,
    );
  }

  /// Applies a shader mask with a gradient to the widget.
  ///
  /// Useful for creating gradient text or icon effects.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Gradient Text', style: TextStyle(fontSize: 24))
  ///   .shaderMask(
  ///     colors: [Colors.blue, Colors.purple],
  ///   )
  /// ```
  Widget shaderMask({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
    BlendMode blendMode = BlendMode.srcIn,
  }) {
    return ShaderMask(
      blendMode: blendMode,
      shaderCallback: (bounds) => LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
      ).createShader(bounds),
      child: this,
    );
  }

  /// Clips the widget with a custom clipper.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('photo.jpg').clip(MyCustomClipper())
  /// ```
  Widget clip(CustomClipper<Path> clipper) {
    return ClipPath(clipper: clipper, child: this);
  }
}
