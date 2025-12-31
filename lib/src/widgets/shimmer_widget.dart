import 'package:flutter/material.dart';

/// A widget that adds a shimmer loading effect to its child.
///
/// The shimmer effect creates a subtle animation that sweeps across
/// the child widget, commonly used as a loading placeholder.
///
/// ## Example
///
/// ```dart
/// ShimmerWidget(
///   baseColor: Colors.grey[300]!,
///   highlightColor: Colors.grey[100]!,
///   child: Container(
///     width: 200,
///     height: 100,
///     color: Colors.white,
///   ),
/// )
/// ```
class ShimmerWidget extends StatefulWidget {
  /// The child widget to apply the shimmer effect to.
  final Widget child;

  /// The base color of the shimmer effect.
  final Color baseColor;

  /// The highlight color that sweeps across.
  final Color highlightColor;

  /// The duration of one shimmer cycle.
  final Duration duration;

  /// The direction of the shimmer sweep.
  final ShimmerDirection direction;

  /// Whether the shimmer animation is enabled.
  final bool enabled;

  /// Creates a shimmer widget.
  const ShimmerWidget({
    super.key,
    required this.child,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.duration = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.leftToRight,
    this.enabled = true,
  });

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

/// Direction of the shimmer effect.
enum ShimmerDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant ShimmerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Gradient _getGradient() {
    switch (widget.direction) {
      case ShimmerDirection.leftToRight:
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            widget.baseColor,
            widget.highlightColor,
            widget.baseColor,
          ],
          stops: [
            _animation.value,
            _animation.value + 0.5,
            _animation.value + 1.0,
          ],
        );
      case ShimmerDirection.rightToLeft:
        return LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            widget.baseColor,
            widget.highlightColor,
            widget.baseColor,
          ],
          stops: [
            _animation.value,
            _animation.value + 0.5,
            _animation.value + 1.0,
          ],
        );
      case ShimmerDirection.topToBottom:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            widget.baseColor,
            widget.highlightColor,
            widget.baseColor,
          ],
          stops: [
            _animation.value,
            _animation.value + 0.5,
            _animation.value + 1.0,
          ],
        );
      case ShimmerDirection.bottomToTop:
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            widget.baseColor,
            widget.highlightColor,
            widget.baseColor,
          ],
          stops: [
            _animation.value,
            _animation.value + 0.5,
            _animation.value + 1.0,
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => _getGradient().createShader(bounds),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
