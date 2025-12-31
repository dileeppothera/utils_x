import 'package:flutter/material.dart';
import 'package:utils_x/utils_x.dart';
import '../widgets/helpers.dart';

/// Demo page for v1.1.0 new features.
class NewFeaturesDemoPage extends StatefulWidget {
  const NewFeaturesDemoPage({super.key});

  @override
  State<NewFeaturesDemoPage> createState() => _NewFeaturesDemoPageState();
}

class _NewFeaturesDemoPageState extends State<NewFeaturesDemoPage> {
  bool _showFirst = true;
  int _switcherIndex = 0;
  String? _droppedItem;
  final List<String> _dismissibleItems = ['Item 1', 'Item 2', 'Item 3'];
  bool _neuButton1Pressed = false;
  bool _neuButton2Pressed = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            title: 'New in v1.1.0',
            subtitle: 'Shimmer, Glassmorphism, Swipe, Drag & Drop, and more!',
          ),

          // Shimmer Demo
          buildSection(
            title: '.shimmer()',
            description: 'Add shimmer loading effect to any widget',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ).shimmer(),
                        const SizedBox(height: 8),
                        const Text(
                          'Default',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2D2D3A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ).shimmer(
                          baseColor: const Color(0xFF2D2D3A),
                          highlightColor: const Color(0xFF4A4A5A),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Dark Mode',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Skeleton loading example
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E32),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                      ).shimmer(),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 14,
                              width: double.infinity,
                              color: Colors.grey[300],
                            ).shimmer().rounded(4),
                            const SizedBox(height: 8),
                            Container(
                              height: 14,
                              width: 120,
                              color: Colors.grey[300],
                            ).shimmer().rounded(4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Glassmorphism Demo
          buildSection(
            title: '.glassmorphism()',
            description: 'Frosted glass effect with blur and transparency',
            child: Stack(
              children: [
                // Background with colors
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFFEC4899)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ).centered(),
                ),
                // Glassmorphism overlay
                const Text(
                      'Frosted Glass',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                    .padding(20)
                    .glassmorphism(blur: 10, opacity: 0.1)
                    .centered()
                    .size(height: 150),
              ],
            ),
          ),

          // Neumorphism Demo
          buildSection(
            title: '.neumorphism()',
            description: 'Soft UI buttons - tap and hold to see pressed state!',
            child: Container(
              padding: const EdgeInsets.all(24),
              color: const Color(0xFFE0E5EC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTapDown: (_) =>
                            setState(() => _neuButton1Pressed = true),
                        onTapUp: (_) {
                          setState(() => _neuButton1Pressed = false);
                          showAppSnackbar(context, '❤️ Liked!');
                        },
                        onTapCancel: () =>
                            setState(() => _neuButton1Pressed = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          child:
                              const Icon(
                                    Icons.favorite,
                                    size: 32,
                                    color: Color(0xFF6366F1),
                                  )
                                  .padding(20)
                                  .neumorphism(isPressed: _neuButton1Pressed),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Like',
                        style: TextStyle(color: Colors.black54, fontSize: 11),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTapDown: (_) =>
                            setState(() => _neuButton2Pressed = true),
                        onTapUp: (_) {
                          setState(() => _neuButton2Pressed = false);
                          showAppSnackbar(context, '⭐ Starred!');
                        },
                        onTapCancel: () =>
                            setState(() => _neuButton2Pressed = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          child:
                              const Icon(
                                    Icons.star,
                                    size: 32,
                                    color: Color(0xFFF59E0B),
                                  )
                                  .padding(20)
                                  .neumorphism(isPressed: _neuButton2Pressed),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Star',
                        style: TextStyle(color: Colors.black54, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ).rounded(16),
          ),

          // ShaderMask / Gradient Text Demo
          buildSection(
            title: '.shaderMask()',
            description: 'Apply gradients to text and icons',
            child: Column(
              children: [
                const Text(
                  'Gradient Text',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ).shaderMask(
                  colors: [const Color(0xFF6366F1), const Color(0xFFEC4899)],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 48,
                    ).shaderMask(colors: [Colors.red, Colors.pink]),
                    const Icon(
                      Icons.star,
                      size: 48,
                    ).shaderMask(colors: [Colors.amber, Colors.orange]),
                    const Icon(
                      Icons.bolt,
                      size: 48,
                    ).shaderMask(colors: [Colors.blue, Colors.cyan]),
                  ],
                ),
              ],
            ),
          ),

          // Swipe Gestures Demo
          buildSection(
            title: '.onSwipe()',
            description: 'Swipe gesture detection',
            child:
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF10B981), Color(0xFF3B82F6)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.swipe, color: Colors.white, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'Swipe in any direction!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ).centered(),
                ).onSwipe(
                  onSwipeLeft: () =>
                      showAppSnackbar(context, '⬅️ Swiped Left!'),
                  onSwipeRight: () =>
                      showAppSnackbar(context, '➡️ Swiped Right!'),
                  onSwipeUp: () => showAppSnackbar(context, '⬆️ Swiped Up!'),
                  onSwipeDown: () =>
                      showAppSnackbar(context, '⬇️ Swiped Down!'),
                ),
          ),

          // Drag & Drop Demo
          buildSection(
            title: '.draggable() & .dragTarget()',
            description: 'Drag widgets and drop them on targets',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Draggable item
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.drag_indicator, color: Colors.white),
                      SizedBox(height: 4),
                      Text(
                        'Drag me',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ).draggable<String>(
                  data: 'Dropped!',
                  feedback: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.drag_indicator,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Drop target
                Container(
                  width: 120,
                  height: 80,
                  decoration: BoxDecoration(
                    color: _droppedItem != null
                        ? const Color(0xFF10B981)
                        : const Color(0xFF2D2D3A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF10B981),
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _droppedItem != null
                            ? Icons.check_circle
                            : Icons.download,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _droppedItem ?? 'Drop here',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ).dragTarget<String>(
                  onAccept: (data) => setState(() => _droppedItem = data),
                ),
              ],
            ),
          ),

          // Dismissible Demo
          buildSection(
            title: '.dismissible()',
            description: 'Swipe to dismiss items',
            child: Column(
              children: _dismissibleItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D2D3A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.drag_handle,
                              color: Colors.white54,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              item,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            const Text(
                              '← Swipe →',
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ).dismissible(
                        key: ValueKey(item),
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 16),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        secondaryBackground: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.archive, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          setState(() => _dismissibleItems.remove(item));
                          showAppSnackbar(context, '$item dismissed!');
                        },
                      ),
                );
              }).toList(),
            ),
          ),

          // Animated Switcher Demo
          buildSection(
            title: '.animatedSwitcher()',
            description: 'Smooth animated widget switching',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => setState(
                        () => _switcherIndex = (_switcherIndex - 1) % 3,
                      ),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const SizedBox(width: 24),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: [
                          const Color(0xFF6366F1),
                          const Color(0xFF10B981),
                          const Color(0xFFF59E0B),
                        ][_switcherIndex.abs() % 3],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '${(_switcherIndex.abs() % 3) + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ).centered(),
                    ).animatedSwitcher(key: ValueKey(_switcherIndex)),
                    const SizedBox(width: 24),
                    IconButton(
                      onPressed: () => setState(
                        () => _switcherIndex = (_switcherIndex + 1) % 3,
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Cross Fade Demo
          buildSection(
            title: '.crossFade()',
            description: 'AnimatedCrossFade between two states',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Show First:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _showFirst,
                      onChanged: (v) => setState(() => _showFirst = v),
                      activeTrackColor: const Color(0xFF6366F1),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.cloud_upload, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Uploading...',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ).crossFade(
                  showFirst: _showFirst,
                  secondChild: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Complete!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Hover Elevation Demo (for web/desktop)
          buildSection(
            title: '.hoverElevation()',
            description: 'Elevation on hover (works on web/desktop)',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Hover Me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ).hoverElevation(
                  baseElevation: 2,
                  hoverElevation: 12,
                  borderRadius: BorderRadius.circular(12),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Me Too!',
                    style: TextStyle(color: Colors.white),
                  ),
                ).hoverElevation(
                  baseElevation: 2,
                  hoverElevation: 12,
                  shadowColor: const Color(0xFF10B981),
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          ),

          // More Layout Extensions
          buildSection(
            title: 'More Layout Extensions',
            description: '.scrollable(), .positioned(), .card(), etc.',
            child: Column(
              children: [
                // Card extension demo
                const ListTile(
                  leading: Icon(Icons.credit_card, color: Colors.white),
                  title: Text(
                    'Card Extension',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '.card() wrapper',
                    style: TextStyle(color: Colors.white54),
                  ),
                ).card(
                  color: const Color(0xFF2D2D3A),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 12),
                // ColoredBox demo
                const Text(
                  '.coloredBox() - Efficient background',
                  style: TextStyle(color: Colors.white),
                ).padding(16).coloredBox(const Color(0xFF6366F1)).rounded(8),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ).safeArea(),
    );
  }
}
