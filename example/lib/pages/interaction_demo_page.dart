import 'package:flutter/material.dart';
import 'package:utils_x/utils_x.dart';
import '../widgets/helpers.dart';

/// Demo page for interaction extensions.
class InteractionDemoPage extends StatelessWidget {
  const InteractionDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            title: 'Interaction Extensions',
            subtitle: 'Add press effects, taps, and gestures',
          ),

          // Press Effect Demo
          buildSection(
            title: '.pressEffect()',
            description: 'Scale-down animation on press - TRY PRESSING!',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDemoCard(
                  color: const Color(0xFF6366F1),
                  icon: Icons.favorite,
                  label: 'Like',
                ).pressEffect(
                  scale: 0.85,
                  onTap: () => showAppSnackbar(context, 'Liked!'),
                ),
                buildDemoCard(
                  color: const Color(0xFF10B981),
                  icon: Icons.share,
                  label: 'Share',
                ).pressEffect(
                  scale: 0.8,
                  onTap: () => showAppSnackbar(context, 'Shared!'),
                ),
                buildDemoCard(
                  color: const Color(0xFFF59E0B),
                  icon: Icons.bookmark,
                  label: 'Save',
                ).pressEffect(
                  scale: 0.75,
                  duration: const Duration(milliseconds: 150),
                  onTap: () => showAppSnackbar(context, 'Saved!'),
                ),
              ],
            ),
          ),

          // Simple Tap Demo
          buildSection(
            title: '.onTap()',
            description: 'Simple tap handler',
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(24),
              child: const Center(
                child: Text(
                  'Tap Me!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ).onTap(() => showAppSnackbar(context, 'Tapped!')),
          ),

          // Ripple Effect Demo
          buildSection(
            title: '.ripple()',
            description: 'Material ripple effect',
            child:
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E32),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF6366F1),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Center(
                    child: Text(
                      'Ripple Effect',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ).ripple(
                  onTap: () => showAppSnackbar(context, 'Ripple!'),
                  splashColor: const Color(0xFF6366F1).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
          ),

          // Hover Scale Demo
          buildSection(
            title: '.hoverScale()',
            description: 'Scale up on hover (web/desktop)',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildMiniCard('1.05x', Colors.purple).hoverScale(1.05),
                buildMiniCard('1.1x', Colors.blue).hoverScale(1.1),
                buildMiniCard('1.15x', Colors.teal).hoverScale(1.15),
              ],
            ),
          ),

          // Gesture Handlers Demo
          buildSection(
            title: 'Gesture Handlers',
            description: '.onLongPress() & .onDoubleTap()',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEC4899),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.touch_app, color: Colors.white, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'Long Press',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ).onLongPress(() => showAppSnackbar(context, 'Long Pressed!')),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF14B8A6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.ads_click, color: Colors.white, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'Double Tap',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ).onDoubleTap(() => showAppSnackbar(context, 'Double Tapped!')),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ).safeArea(),
    );
  }
}
