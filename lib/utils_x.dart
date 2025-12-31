/// A collection of powerful Flutter widget extensions for cleaner, more expressive code.
/// Developed by Dileep P.
///
/// Utils X provides chainable widget extensions that make your Flutter code
/// more readable and reduce boilerplate.
///
/// ## Usage
///
/// ```dart
/// import 'package:utils_x/utils_x.dart';
///
/// // Add press effect to any widget
/// MyButton().pressEffect()
///
/// // Chain multiple extensions
/// MyCard()
///     .pressEffect()
///     .padding(16)
///     .rounded(12)
///     .centered()
/// ```
library;

// Export all extensions
export 'src/extensions/widget_extensions.dart';
export 'src/extensions/interaction_extensions.dart';
export 'src/extensions/layout_extensions.dart';
export 'src/extensions/styling_extensions.dart';
export 'src/extensions/visibility_extensions.dart';

// Export widgets (if any custom widgets are needed)
export 'src/widgets/press_effect_widget.dart';
export 'src/widgets/shimmer_widget.dart';
