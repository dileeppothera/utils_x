import 'package:flutter/material.dart';
import '../widgets/press_effect_widget.dart';

/// Extensions for adding interaction effects to widgets.
///
/// These extensions provide easy-to-use methods for adding
/// common interaction patterns like press effects, taps, and gestures.
extension InteractionExtensions on Widget {
  /// Adds a press effect (scale down animation) to the widget.
  ///
  /// When the user presses the widget, it scales down slightly,
  /// providing visual feedback.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   child: Text('Press Me'),
  /// ).pressEffect(
  ///   onTap: () => print('Pressed!'),
  /// )
  /// ```
  ///
  /// ## Parameters
  ///
  /// - [onTap]: Callback when the widget is tapped.
  /// - [onLongPress]: Callback when the widget is long pressed.
  /// - [scale]: The scale factor when pressed (default: 0.95).
  /// - [duration]: Animation duration (default: 100ms).
  /// - [curve]: Animation curve (default: Curves.easeInOut).
  /// - [enabled]: Whether the effect is enabled (default: true).
  Widget pressEffect({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    double scale = 0.95,
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.easeInOut,
    bool enabled = true,
  }) {
    return PressEffectWidget(
      onTap: onTap,
      onLongPress: onLongPress,
      scaleDown: scale,
      duration: duration,
      curve: curve,
      enabled: enabled,
      child: this,
    );
  }

  /// Adds a simple tap handler to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Click me').onTap(() => print('Tapped!'))
  /// ```
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Adds a long press handler to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Long press me').onLongPress(() => print('Long pressed!'))
  /// ```
  Widget onLongPress(VoidCallback onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Adds a double tap handler to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Image.asset('photo.jpg').onDoubleTap(() => print('Liked!'))
  /// ```
  Widget onDoubleTap(VoidCallback onDoubleTap) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      behavior: HitTestBehavior.opaque,
      child: this,
    );
  }

  /// Wraps the widget with an InkWell for Material ripple effect.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(child: Text('Tap me')).ripple(onTap: () => print('Tapped!'))
  /// ```
  Widget ripple({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    Color? splashColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) {
    return Stack(
      children: [
        this,
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              onLongPress: onLongPress,
              splashColor: splashColor,
              highlightColor: highlightColor ?? Colors.transparent,
              borderRadius: borderRadius,
              customBorder: borderRadius != null
                  ? RoundedRectangleBorder(borderRadius: borderRadius)
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  /// Adds hover effect (scale up) for web/desktop.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Card(child: Text('Hover me')).hoverScale(1.05)
  /// ```
  Widget hoverScale([double scale = 1.05]) {
    return _HoverScaleWidget(scale: scale, child: this);
  }
}

/// Internal widget for hover scale effect.
class _HoverScaleWidget extends StatefulWidget {
  final Widget child;
  final double scale;

  const _HoverScaleWidget({required this.child, required this.scale});

  @override
  State<_HoverScaleWidget> createState() => _HoverScaleWidgetState();
}

class _HoverScaleWidgetState extends State<_HoverScaleWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scale : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
