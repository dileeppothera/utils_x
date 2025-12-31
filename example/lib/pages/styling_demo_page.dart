import 'package:flutter/material.dart';
import 'package:utils_x/utils_x.dart';
import '../widgets/helpers.dart';

/// Demo page for styling extensions.
class StylingDemoPage extends StatelessWidget {
  const StylingDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            title: 'Styling Extensions',
            subtitle: 'Shadows, gradients, borders, effects',
          ),

          // Rounded Corners Demo
          buildSection(
            title: 'Border Radius Extensions',
            description: '.rounded(), .roundedOnly(), .circular()',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      color: const Color(0xFF6366F1),
                    ).rounded(12),
                    const SizedBox(height: 8),
                    const Text(
                      '.rounded(12)',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      color: const Color(0xFF10B981),
                    ).roundedOnly(topLeft: 20, bottomRight: 20),
                    const SizedBox(height: 8),
                    const Text(
                      '.roundedOnly()',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      color: const Color(0xFFF59E0B),
                    ).circular(),
                    const SizedBox(height: 8),
                    const Text(
                      '.circular()',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Shadow Demo
          buildSection(
            title: 'Shadow & Glow Extensions',
            description: '.withShadow() and .glow() for elevation and effects',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Soft',
                    style: TextStyle(color: Colors.black54),
                  ).centered(),
                ).withShadow(
                  blur: 20,
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(12),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Glow',
                    style: TextStyle(color: Colors.white),
                  ).centered(),
                ).glow(),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF59E0B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Hard',
                    style: TextStyle(color: Colors.black),
                  ).centered(),
                ).withShadow(
                  blur: 0,
                  offset: const Offset(4, 4),
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          ),

          // Transform Demo
          buildSection(
            title: 'Transform Extensions',
            description: '.rotate(), .scale(), .translate(), .flip()',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: const Color(0xFF6366F1),
                    ).rotate(45),
                    const SizedBox(height: 16),
                    const Text(
                      '.rotate(45)',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ).scale(1.2),
                    const SizedBox(height: 16),
                    const Text(
                      '.scale(1.2)',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFF59E0B),
                      size: 40,
                    ).flipH(),
                    const SizedBox(height: 16),
                    const Text(
                      '.flipH()',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Color(0xFFEC4899),
                      size: 40,
                    ).flipV(),
                    const SizedBox(height: 16),
                    const Text(
                      '.flipV()',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Opacity Demo
          buildSection(
            title: '.opacity()',
            description: 'Set widget opacity',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOpacityBox(1.0),
                _buildOpacityBox(0.75),
                _buildOpacityBox(0.5),
                _buildOpacityBox(0.25),
              ],
            ),
          ),

          // Gradient Demo
          buildSection(
            title: '.withGradient()',
            description: 'Add gradient backgrounds',
            child: Column(
              children: [
                _buildGradientItem('Purple → Pink', [
                  const Color(0xFF6366F1),
                  const Color(0xFFEC4899),
                ]),
                _buildGradientItem('Green → Blue', [
                  const Color(0xFF10B981),
                  const Color(0xFF3B82F6),
                ]),
                _buildGradientItem('Orange → Red', [
                  const Color(0xFFF59E0B),
                  const Color(0xFFEF4444),
                ]),
              ],
            ),
          ),

          // Border Demo
          buildSection(
            title: '.withBorder()',
            description: 'Add borders to widgets',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: const Text(
                    'Default',
                    style: TextStyle(color: Colors.white70, fontSize: 11),
                  ).centered(),
                ).withBorder(borderRadius: BorderRadius.circular(12)),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: const Text(
                    'Blue 2px',
                    style: TextStyle(color: Color(0xFF6366F1), fontSize: 11),
                  ).centered(),
                ).withBorder(
                  color: const Color(0xFF6366F1),
                  width: 2,
                  borderRadius: BorderRadius.circular(12),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: const Text(
                    'Green 3px',
                    style: TextStyle(color: Color(0xFF10B981), fontSize: 11),
                  ).centered(),
                ).withBorder(
                  color: const Color(0xFF10B981),
                  width: 3,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          ),

          // Background Demo
          buildSection(
            title: '.withBackground()',
            description: 'Add color backgrounds',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                      'Purple BG',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .padding(16)
                    .withBackground(
                      const Color(0xFF6366F1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                const Text(
                      'Green BG',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .padding(16)
                    .withBackground(
                      const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(12),
                    ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ).safeArea(),
    );
  }
}

Widget _buildOpacityBox(double opacity) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF6366F1),
          borderRadius: BorderRadius.circular(8),
        ),
      ).opacity(opacity),
      const SizedBox(height: 8),
      Text(
        '${(opacity * 100).toInt()}%',
        style: const TextStyle(color: Colors.white70, fontSize: 11),
      ),
    ],
  );
}

Widget _buildGradientItem(String label, List<Color> colors) {
  return SizedBox(
        height: 60,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ).centered(),
      )
      .withGradient(colors: colors, borderRadius: BorderRadius.circular(12))
      .fullWidth()
      .padding(4);
}
