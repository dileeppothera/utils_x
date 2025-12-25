import 'package:flutter/material.dart';

/// Extensions for controlling widget visibility.
///
/// These extensions provide convenient methods for conditionally
/// showing, hiding, or removing widgets from the widget tree.
extension VisibilityExtensions on Widget {
  /// Conditionally shows or hides the widget.
  ///
  /// When [condition] is false, the widget is hidden but still
  /// occupies space in the layout (like CSS visibility: hidden).
  ///
  /// ## Example
  ///
  /// ```dart
  /// Text('Secret').visible(isLoggedIn)
  /// ```
  Widget visible(bool condition) {
    return Visibility(
      visible: condition,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: this,
    );
  }

  /// Conditionally removes the widget from the tree.
  ///
  /// When [condition] is true, the widget is completely removed
  /// from the tree (like CSS display: none).
  ///
  /// ## Example
  ///
  /// ```dart
  /// AdminPanel().gone(!isAdmin)
  /// ```
  Widget gone(bool condition) {
    return condition ? const SizedBox.shrink() : this;
  }

  /// Shows the widget only when [condition] is true.
  ///
  /// This is the opposite of [gone]. When condition is false,
  /// the widget is removed from the tree.
  ///
  /// ## Example
  ///
  /// ```dart
  /// PremiumBadge().showIf(isPremiumUser)
  /// ```
  Widget showIf(bool condition) {
    return condition ? this : const SizedBox.shrink();
  }

  /// Shows the widget or an alternative based on condition.
  ///
  /// ## Example
  ///
  /// ```dart
  /// LoadingSpinner().showOrElse(
  ///   isLoading,
  ///   otherwise: DataContent(),
  /// )
  /// ```
  Widget showOrElse(bool condition, {required Widget otherwise}) {
    return condition ? this : otherwise;
  }

  /// Wraps the widget to absorb pointer events (disables interactions).
  ///
  /// ## Example
  ///
  /// ```dart
  /// Button('Submit').absorbPointer(isSubmitting)
  /// ```
  Widget absorbPointer(bool absorbing) {
    return AbsorbPointer(absorbing: absorbing, child: this);
  }

  /// Ignores pointer events on this widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// OverlayDecoration().ignorePointer()
  /// ```
  Widget ignorePointer([bool ignoring = true]) {
    return IgnorePointer(ignoring: ignoring, child: this);
  }

  /// Wraps with AnimatedOpacity for fade in/out effects.
  ///
  /// ## Example
  ///
  /// ```dart
  /// Content().fadeVisible(isVisible)
  /// ```
  Widget fadeVisible(
    bool visible, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: duration,
      curve: curve,
      child: this,
    );
  }

  /// Animates the widget in/out with scale.
  ///
  /// ## Example
  ///
  /// ```dart
  /// FloatingButton().scaleVisible(isExpanded)
  /// ```
  Widget scaleVisible(
    bool visible, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    double hiddenScale = 0.0,
  }) {
    return AnimatedScale(
      scale: visible ? 1.0 : hiddenScale,
      duration: duration,
      curve: curve,
      child: this,
    );
  }

  /// Animates the widget in/out with slide.
  ///
  /// ## Example
  ///
  /// ```dart
  /// BottomSheet().slideVisible(isOpen, direction: Axis.vertical)
  /// ```
  Widget slideVisible(
    bool visible, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Offset hiddenOffset = const Offset(0, 1),
  }) {
    return AnimatedSlide(
      offset: visible ? Offset.zero : hiddenOffset,
      duration: duration,
      curve: curve,
      child: this,
    );
  }
}
