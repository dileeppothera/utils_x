# utils_x

A collection of powerful Flutter widget extensions for cleaner, more expressive code.
Developed by Dileep P.
Add press effects, padding, styling, and more with simple chainable methods.

[![pub package](https://img.shields.io/pub/v/utils_x.svg)](https://pub.dev/packages/utils_x)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Features

- **Simple API** - Chainable extensions that read naturally
- **Rich Styling** - Shadows, gradients, borders, blur effects
- **Interaction Effects** - Press effects, tap handlers, hover states
- **Layout Helpers** - Padding, centering, sizing shortcuts
- **Visibility Control** - Conditional rendering with animations
- **Platform Ready** - Works on mobile, web, and desktop

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  utils_x: ^1.0.0
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

```dart
// Press effect with options
MyButton().pressEffect(
  onTap: () => print('Pressed!'),
  scale: 0.95,
  duration: Duration(milliseconds: 100),
  curve: Curves.easeInOut,
)

// Simple tap
Icon(Icons.favorite).onTap(() => likePost())

// Material ripple
Container(child: Text('Tap me')).ripple(onTap: () {})
```

### Layout Extensions

| Extension | Description |
|-----------|-------------|
| `.padding(16)` | Padding all sides |
| `.paddingH(16)` | Horizontal padding |
| `.paddingV(8)` | Vertical padding |
| `.paddingSymmetric()` | Symmetric padding |
| `.paddingOnly()` | Custom padding |
| `.centered()` | Center widget |
| `.align(Alignment.topRight)` | Align widget |
| `.expanded()` | Wrap with Expanded |
| `.flexible()` | Wrap with Flexible |
| `.size(width: 100, height: 50)` | Fixed size |
| `.square(48)` | Square dimensions |
| `.fullWidth()` | Full available width |
| `.safeArea()` | Wrap with SafeArea |
| `.sliverBox()` | SliverToBoxAdapter |

```dart
Text('Hello')
    .padding(16)
    .centered()
    .fullWidth()

// In a Row/Column
Text('Expand me').expanded(flex: 2)
```

### Styling Extensions

| Extension | Description |
|-----------|-------------|
| `.rounded(12)` | Rounded corners |
| `.roundedOnly()` | Custom corner radius |
| `.circular()` | Clip to circle |
| `.withShadow()` | Add box shadow |
| `.opacity(0.5)` | Set opacity |
| `.rotate(45)` | Rotate by degrees |
| `.scale(1.5)` | Scale transform |
| `.translate(x: 10)` | Translate position |
| `.flipH()` / `.flipV()` | Flip horizontally/vertically |
| `.blur(10)` | Blur effect (glassmorphism) |
| `.withBorder()` | Add border |
| `.withGradient()` | Gradient background |
| `.withBackground()` | Color background |

```dart
// Styled card
Container(child: Text('Card'))
    .padding(16)
    .withBackground(Colors.white)
    .rounded(12)
    .withShadow(blur: 20, color: Colors.black12)

// Glassmorphism
Container(
  color: Colors.white.withOpacity(0.1),
  child: Text('Frosted'),
).blur(10).rounded(16)

// Gradient background
Text('Gradient').withGradient(
  colors: [Colors.blue, Colors.purple],
  borderRadius: BorderRadius.circular(8),
)
```

### Visibility Extensions

| Extension | Description |
|-----------|-------------|
| `.visible(condition)` | Show/hide (maintains space) |
| `.gone(condition)` | Remove from tree if true |
| `.showIf(condition)` | Show only if true |
| `.showOrElse(condition, otherwise)` | Show this or alternative |
| `.absorbPointer(condition)` | Disable interactions |
| `.ignorePointer()` | Ignore touch events |
| `.fadeVisible(condition)` | Animated fade |
| `.scaleVisible(condition)` | Animated scale |
| `.slideVisible(condition)` | Animated slide |

```dart
// Conditional rendering
AdminPanel().showIf(isAdmin)

// Remove if condition is true
EditButton().gone(!isOwner)

// Animated visibility
Content().fadeVisible(isLoaded)
FloatingButton().scaleVisible(isExpanded)
```

### General Extensions

| Extension | Description |
|-----------|-------------|
| `.tooltip('message')` | Add tooltip |
| `.semanticsLabel('label')` | Accessibility label |
| `.hero('tag')` | Hero animation tag |
| `.material()` | Wrap with Material |
| `.repaintBoundary()` | Performance optimization |
| `.fitted()` | FittedBox wrapper |
| `.aspectRatio(16/9)` | Aspect ratio |
| `.fractionalSize()` | Proportional sizing |

```dart
// Hero animation
Image.asset('photo.jpg').hero('photo_1')

// Accessibility
Icon(Icons.add).semanticsLabel('Add new item')
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
