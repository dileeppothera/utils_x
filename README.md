# utils_x

A collection of powerful Flutter widget extensions for cleaner, more expressive code.
Developed by Dileep P.
Add press effects, padding, styling, and more with simple chainable methods.

[![pub package](https://img.shields.io/pub/v/utils_x.svg)](https://pub.dev/packages/utils_x)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Features

- **Simple API** - Chainable extensions that read naturally
- **Rich Styling** - Shadows, gradients, borders, blur, glassmorphism, neumorphism, shimmer effects
- **Interaction Effects** - Press effects, tap handlers, swipe gestures, drag & drop, hover states
- **Layout Helpers** - Padding, centering, sizing, scrollable, positioned shortcuts
- **Visibility Control** - Conditional rendering with animations, cross-fade, animated switcher
- **Platform Ready** - Works on mobile, web, and desktop

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  utils_x: ^1.1.0
```

Then run:
```bash
flutter pub get
```

## Quick Start

```dart
import 'package:utils_x/utils_x.dart';

// Before (verbose)
GestureDetector(
  onTap: () => print('Pressed!'),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(child: Text('Hello')),
    ),
  ),
)

// After (clean & expressive)
Text('Hello')
    .padding(16)
    .rounded(12)
    .pressEffect(onTap: () => print('Pressed!'))
```

## Extensions Reference

### Interaction Extensions

| Extension | Description |
|-----------|-------------|
| `.pressEffect()` | Scale-down animation on press |
| `.onTap(() {})` | Simple tap handler |
| `.onLongPress(() {})` | Long press handler |
| `.onDoubleTap(() {})` | Double tap handler |
| `.ripple()` | Material ripple effect |
| `.hoverScale(1.05)` | Scale up on hover (web/desktop) |
| `.hoverElevation()` | Elevation on hover (web/desktop) |
| `.onSwipe()` | Swipe gesture handlers |
| `.draggable()` | Make widget draggable |
| `.dragTarget()` | Create drop zones |
| `.dismissible()` | Swipe to dismiss |

```dart
// Press effect with options
MyButton().pressEffect(
  onTap: () => print('Pressed!'),
  scale: 0.95,
  duration: Duration(milliseconds: 100),
)

// Swipe gestures
Card(child: Text('Swipe me')).onSwipe(
  onSwipeLeft: () => print('Swiped left!'),
  onSwipeRight: () => print('Swiped right!'),
)

// Drag & Drop
Container(child: Text('Drag me')).draggable<String>(data: 'item_1')
Container(child: Text('Drop here')).dragTarget<String>(
  onAccept: (data) => print('Received: $data'),
)
```

### Layout Extensions

| Extension | Description |
|-----------|-------------|
| `.padding(16)` | Padding all sides |
| `.paddingH(16)` / `.paddingV(8)` | Horizontal/Vertical padding |
| `.paddingSymmetric()` / `.paddingOnly()` | Custom padding |
| `.margin(16)` / `.marginH()` / `.marginV()` | Margin helpers |
| `.centered()` | Center widget |
| `.align(Alignment.topRight)` | Align widget |
| `.expanded()` / `.flexible()` | Flex wrappers |
| `.size()` / `.square(48)` / `.fullWidth()` | Sizing helpers |
| `.scrollable()` | SingleChildScrollView wrapper |
| `.positioned()` / `.positionedFill()` | Stack positioning |
| `.intrinsicWidth()` / `.intrinsicHeight()` | Intrinsic sizing |
| `.safeArea()` / `.sliverBox()` | Layout wrappers |

```dart
// Layout chain
Text('Hello')
    .padding(16)
    .centered()
    .fullWidth()

// Scrollable content
Column(children: [...]).scrollable()

// Stack positioning
Icon(Icons.close).positioned(top: 8, right: 8)
```

### Styling Extensions

| Extension | Description |
|-----------|-------------|
| `.rounded(12)` / `.roundedOnly()` / `.circular()` | Border radius |
| `.withShadow()` / `.glow()` | Shadows and glow effects |
| `.glassmorphism()` | Frosted glass effect |
| `.shimmer()` | Shimmer loading animation |
| `.neumorphism()` | Soft UI / neumorphic effect |
| `.shaderMask()` | Gradient text/icons |
| `.opacity(0.5)` | Set opacity |
| `.rotate(45)` / `.scale(1.5)` / `.translate()` | Transforms |
| `.flipH()` / `.flipV()` | Flip transforms |
| `.blur(10)` | Blur effect |
| `.withBorder()` / `.withGradient()` / `.withBackground()` | Decorations |

```dart
// Glassmorphism card
Container(child: Text('Frosted Card'))
    .padding(16)
    .glassmorphism(blur: 10, opacity: 0.1)

// Shimmer loading
Container(
  width: 200,
  height: 50,
  color: Colors.grey[300],
).shimmer()

// Neumorphism
Container(
  padding: EdgeInsets.all(20),
  child: Icon(Icons.star),
).neumorphism()

// Gradient text
Text('Gradient Text', style: TextStyle(fontSize: 24))
    .shaderMask(colors: [Colors.blue, Colors.purple])
```

### Visibility Extensions

| Extension | Description |
|-----------|-------------|
| `.visible(condition)` | Show/hide (maintains space) |
| `.gone(condition)` / `.showIf(condition)` | Conditional rendering |
| `.showOrElse(condition, otherwise)` | Show this or alternative |
| `.absorbPointer()` / `.ignorePointer()` | Pointer control |
| `.fadeVisible()` / `.scaleVisible()` / `.slideVisible()` | Animated visibility |
| `.fadeScaleVisible()` | Combined fade + scale |
| `.rotateVisible()` | Rotation-based visibility |
| `.animatedSwitcher()` | Animated widget switching |
| `.crossFade()` | AnimatedCrossFade wrapper |

```dart
// Conditional rendering
AdminPanel().showIf(isAdmin)

// Animated visibility
Content().fadeVisible(isLoaded)
FloatingButton().fadeScaleVisible(isExpanded)

// Animated switching
currentWidget.animatedSwitcher(key: ValueKey(selectedIndex))

// Cross-fade between states
LoadingWidget().crossFade(
  showFirst: isLoading,
  secondChild: ContentWidget(),
)
```

### General Extensions

| Extension | Description |
|-----------|-------------|
| `.tooltip('message')` | Add tooltip |
| `.semanticsLabel('label')` | Accessibility label |
| `.hero('tag')` | Hero animation tag |
| `.material()` / `.card()` | Material wrappers |
| `.inkWell()` | InkWell wrapper |
| `.repaintBoundary()` | Performance optimization |
| `.keyedSubtree(key)` | Force widget rebuild |
| `.decorated()` | DecoratedBox wrapper |
| `.coloredBox()` | Efficient background color |
| `.focus()` | Focus management |
| `.fitted()` / `.aspectRatio()` / `.fractionalSize()` | Sizing helpers |

```dart
// Hero animation
Image.asset('photo.jpg').hero('photo_1')

// Card wrapper
ListTile(...).card(elevation: 4)

// Force rebuild with key
MyWidget().keyedSubtree(ValueKey('unique_key'))
```

## Chaining Extensions

Extensions can be chained for powerful, readable code:

```dart
Card(child: Text('Premium Feature'))
    .padding(16)
    .rounded(12)
    .withShadow(blur: 15)
    .pressEffect(onTap: () => openFeature())
    .showIf(isPremiumUser)
    .hero('premium_card')
```

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting a PR.

## License

MIT License - see the [LICENSE](LICENSE) file for details.

---

Developed by **Dileep P** for the Flutter community
