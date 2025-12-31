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

/// Internal widget for hover elevation effect.
class _HoverElevationWidget extends StatefulWidget {
  final Widget child;
  final double baseElevation;
  final double hoverElevation;
  final Color? shadowColor;
  final BorderRadius? borderRadius;

  const _HoverElevationWidget({
    required this.child,
    required this.baseElevation,
    required this.hoverElevation,
    this.shadowColor,
    this.borderRadius,
  });

  @override
  State<_HoverElevationWidget> createState() => _HoverElevationWidgetState();
}

class _HoverElevationWidgetState extends State<_HoverElevationWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor ?? Colors.black26,
              blurRadius: _isHovered
                  ? widget.hoverElevation * 2
                  : widget.baseElevation * 2,
              spreadRadius: _isHovered
                  ? widget.hoverElevation / 2
                  : widget.baseElevation / 2,
              offset: Offset(
                  0, _isHovered ? widget.hoverElevation : widget.baseElevation),
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

/// Direction for swipe detection.
enum SwipeDirection {
  left,
  right,
  up,
  down,
}

/// Extension methods for swipe gestures.
extension SwipeExtensions on Widget {
  /// Adds swipe gesture detection to the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Card(child: Text('Swipe me')).onSwipe(
  ///   onSwipeLeft: () => print('Swiped left!'),
  ///   onSwipeRight: () => print('Swiped right!'),
  /// )
  /// ```
  Widget onSwipe({
    VoidCallback? onSwipeLeft,
    VoidCallback? onSwipeRight,
    VoidCallback? onSwipeUp,
    VoidCallback? onSwipeDown,
    double threshold = 50.0,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < -threshold && onSwipeLeft != null) {
            onSwipeLeft();
          } else if (details.primaryVelocity! > threshold &&
              onSwipeRight != null) {
            onSwipeRight();
          }
        }
      },
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < -threshold && onSwipeUp != null) {
            onSwipeUp();
          } else if (details.primaryVelocity! > threshold &&
              onSwipeDown != null) {
            onSwipeDown();
          }
        }
      },
      child: this,
    );
  }
}

/// Extension methods for draggable widgets.
extension DraggableExtensions on Widget {
  /// Makes the widget draggable.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   child: Text('Drag me'),
  /// ).draggable<String>(
  ///   data: 'item_1',
  ///   feedback: Text('Dragging...'),
  /// )
  /// ```
  Widget draggable<T extends Object>({
    required T data,
    Widget? feedback,
    Widget? childWhenDragging,
    Axis? axis,
    DragAnchorStrategy? dragAnchorStrategy,
    VoidCallback? onDragStarted,
    void Function(DraggableDetails)? onDragEnd,
    void Function(Velocity, Offset)? onDraggableCanceled,
    VoidCallback? onDragCompleted,
  }) {
    return Draggable<T>(
      data: data,
      feedback: feedback ?? Opacity(opacity: 0.7, child: this),
      childWhenDragging:
          childWhenDragging ?? Opacity(opacity: 0.3, child: this),
      axis: axis,
      dragAnchorStrategy: dragAnchorStrategy ?? childDragAnchorStrategy,
      onDragStarted: onDragStarted,
      onDragEnd: onDragEnd,
      onDraggableCanceled: onDraggableCanceled,
      onDragCompleted: onDragCompleted,
      child: this,
    );
  }

  /// Makes the widget a drag target.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Container(
  ///   child: Text('Drop here'),
  /// ).dragTarget<String>(
  ///   onAccept: (data) => print('Received: $data'),
  /// )
  /// ```
  Widget dragTarget<T extends Object>({
    required void Function(T) onAccept,
    bool Function(T?)? onWillAccept,
    void Function(T?)? onLeave,
  }) {
    return DragTarget<T>(
      builder: (context, candidateData, rejectedData) => this,
      onAcceptWithDetails: (details) => onAccept(details.data),
      onWillAcceptWithDetails:
          onWillAccept != null ? (details) => onWillAccept(details.data) : null,
      onLeave: onLeave != null ? (data) => onLeave(data) : null,
    );
  }
}

/// Extension methods for dismissible widgets.
extension DismissibleExtensions on Widget {
  /// Makes the widget dismissible (swipe to remove).
  ///
  /// ## Example
  ///
  /// ```dart
  /// ListTile(title: Text('Swipe to delete'))
  ///   .dismissible(
  ///     key: ValueKey('item_1'),
  ///     onDismissed: (direction) => print('Dismissed!'),
  ///   )
  /// ```
  Widget dismissible({
    required Key key,
    required void Function(DismissDirection) onDismissed,
    Future<bool?> Function(DismissDirection)? confirmDismiss,
    Widget? background,
    Widget? secondaryBackground,
    DismissDirection direction = DismissDirection.horizontal,
    Duration? resizeDuration,
    double dismissThresholds = 0.4,
  }) {
    return Dismissible(
      key: key,
      onDismissed: onDismissed,
      confirmDismiss: confirmDismiss,
      background: background ?? Container(color: Colors.red),
      secondaryBackground: secondaryBackground,
      direction: direction,
      resizeDuration: resizeDuration,
      dismissThresholds: {direction: dismissThresholds},
      child: this,
    );
  }
}

/// Extension methods for hover elevation effect.
extension HoverElevationExtensions on Widget {
  /// Adds hover elevation effect (web/desktop).
  ///
  /// ## Example
  ///
  /// ```dart
  /// Card(child: Text('Hover me')).hoverElevation()
  /// ```
  Widget hoverElevation({
    double baseElevation = 2,
    double hoverElevation = 8,
    Color? shadowColor,
    BorderRadius? borderRadius,
  }) {
    return _HoverElevationWidget(
      baseElevation: baseElevation,
      hoverElevation: hoverElevation,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      child: this,
    );
  }
}
