## 1.1.0

* **New Widget: ShimmerWidget** - Customizable shimmer loading effect widget

* **New Styling Extensions:**
  * `glassmorphism()` - Frosted glass effect with blur, transparency, and border
  * `shimmer()` - Add shimmer loading animation to any widget
  * `neumorphism()` - Soft UI / neumorphic design effect
  * `shaderMask()` - Apply gradient to text/icons
  * `clip()` - Custom clipper support
  * `glow()` - Enhanced with custom `opacity` parameter

* **New Interaction Extensions:**
  * `onSwipe()` - Swipe gesture handlers (left, right, up, down)
  * `draggable()` - Make any widget draggable with drag data
  * `dragTarget()` - Create drop zones for draggable widgets
  * `dismissible()` - Swipe to dismiss functionality
  * `hoverElevation()` - Elevation change on hover (web/desktop)

* **New Layout Extensions:**
  * `scrollable()` - Wrap in SingleChildScrollView
  * `positioned()` - Position within a Stack
  * `positionedFill()` - Fill available space in Stack
  * `intrinsicWidth()` / `intrinsicHeight()` - Intrinsic sizing
  * `limitedBox()` - LimitedBox wrapper
  * `clipRect()` - ClipRect wrapper
  * `marginOnly()` / `marginH()` / `marginV()` - Additional margin helpers

* **New Visibility Extensions:**
  * `animatedSwitcher()` - Smooth animated widget switching
  * `crossFade()` - AnimatedCrossFade wrapper
  * `rotateVisible()` - Rotation-based visibility animation
  * `fadeScaleVisible()` - Combined fade + scale visibility

* **New Widget Extensions:**
  * `keyedSubtree()` - Force widget rebuilds with key
  * `decorated()` - DecoratedBox shorthand
  * `card()` - Card wrapper with customization
  * `inkWell()` - InkWell wrapper
  * `excludeSemantics()` - Accessibility helper
  * `focus()` - Focus management
  * `customPaint()` - CustomPaint wrapper
  * `coloredBox()` - Efficient background color
  * `unconstrained()` - UnconstrainedBox wrapper
  * `overflowBox()` - OverflowBox wrapper

* **Bug Fixes:**
  * Fixed deprecated `withOpacity()` usage, replaced with `withValues(alpha:)`

## 1.0.0

* Initial release
* **Interaction Extensions:**
  * `pressEffect()` - Scale-down animation on press
  * `onTap()` - Simple tap handler
  * `onLongPress()` - Long press handler
  * `onDoubleTap()` - Double tap handler
  * `ripple()` - Material ripple effect
  * `hoverScale()` - Scale on hover for web/desktop

* **Layout Extensions:**
  * `padding()` / `paddingH()` / `paddingV()` / `paddingOnly()` / `paddingSymmetric()`
  * `centered()` - Center widget
  * `align()` - Align widget
  * `expanded()` / `flexible()` - Flex wrappers
  * `size()` / `square()` / `fullWidth()` - Sizing
  * `safeArea()` - SafeArea wrapper
  * `sliverBox()` - SliverToBoxAdapter wrapper
  * `margin()` / `marginSymmetric()` - Margin helpers
  * `constrained()` - ConstrainedBox wrapper

* **Styling Extensions:**
  * `rounded()` / `roundedOnly()` / `circular()` - Border radius
  * `withShadow()` - Box shadows
  * `opacity()` - Opacity control
  * `rotate()` / `scale()` / `translate()` - Transforms
  * `flipH()` / `flipV()` - Flip transforms
  * `blur()` - Blur effect (glassmorphism)
  * `withBorder()` - Border decoration
  * `withGradient()` - Gradient background
  * `withBackground()` - Color background
  * `colorOverlay()` - Color filter overlay

* **Visibility Extensions:**
  * `visible()` - Show/hide maintaining space
  * `gone()` - Remove from tree
  * `showIf()` - Conditional rendering
  * `showOrElse()` - Show or alternative
  * `absorbPointer()` / `ignorePointer()` - Pointer control
  * `fadeVisible()` / `scaleVisible()` / `slideVisible()` - Animated visibility

* **General Extensions:**
  * `tooltip()` - Tooltip wrapper
  * `semanticsLabel()` - Accessibility
  * `hero()` - Hero animation
  * `material()` - Material wrapper
  * `repaintBoundary()` - Performance
  * `fitted()` / `aspectRatio()` / `fractionalSize()` - Sizing helpers
  * `offstage()` - Offstage wrapper
