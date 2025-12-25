import 'package:flutter/material.dart';

/// A widget that adds a press/tap effect (scale down animation) to its child.
///
/// This widget wraps any child widget and provides a visual feedback
/// when the user presses on it, creating a subtle scale-down animation.
///
/// ## Example
///
/// ```dart
/// PressEffectWidget(
///   onTap: () => print('Pressed!'),
///   child: Container(
///     padding: EdgeInsets.all(16),
///     child: Text('Press Me'),
///   ),
/// )
/// ```
class PressEffectWidget extends StatefulWidget {
  /// The child widget to apply the press effect to.
  final Widget child;

  /// Called when the widget is tapped.
  final VoidCallback? onTap;

  /// Called when the widget is long pressed.
  final VoidCallback? onLongPress;

  /// The scale factor when pressed. Default is 0.95 (95% of original size).
  /// Values less than 1.0 will shrink the widget, greater than 1.0 will enlarge.
  final double scaleDown;

  /// The duration of the press animation. Default is 100 milliseconds.
  final Duration duration;

  /// The animation curve. Default is [Curves.easeInOut].
  final Curve curve;

  /// Whether the press effect is enabled. Default is true.
  final bool enabled;

  /// Creates a press effect widget.
  const PressEffectWidget({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.scaleDown = 0.95,
    this.duration = const Duration(milliseconds: 100),
    this.curve = Curves.easeInOut,
    this.enabled = true,
  });

  @override
  State<PressEffectWidget> createState() => _PressEffectWidgetState();
}

class _PressEffectWidgetState extends State<PressEffectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleDown,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(covariant PressEffectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
    if (oldWidget.scaleDown != widget.scaleDown ||
        oldWidget.curve != widget.curve) {
      _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: widget.scaleDown,
      ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.enabled) {
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.enabled) {
      // Ensure animation completes to end state before reversing
      // This makes the press effect visible even on quick taps
      _controller.forward().then((_) {
        if (mounted) {
          _controller.reverse();
        }
      });
    }
  }

  void _onTapCancel() {
    if (widget.enabled) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.enabled ? widget.onTap : null,
      onLongPress: widget.enabled ? widget.onLongPress : null,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: widget.child,
      ),
    );
  }
}
