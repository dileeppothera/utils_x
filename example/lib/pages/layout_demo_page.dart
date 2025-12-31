import 'package:flutter/material.dart';
import 'package:utils_x/utils_x.dart';
import '../widgets/helpers.dart';

/// Demo page for layout extensions.
class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            title: 'Layout Extensions',
            subtitle: 'Padding, centering, sizing shortcuts',
          ),

          // Padding Demo
          buildSection(
            title: 'Padding Extensions',
            description: '.padding(), .paddingH(), .paddingV()',
            child: Column(
              children: [
                buildCodeCompare(
                  label: '.padding(16)',
                  demo: _buildPaddingDemo(
                    color: const Color(0xFF6366F1),
                    text: 'All',
                    paddingType: 'all',
                  ),
                ),
                const SizedBox(height: 12),
                buildCodeCompare(
                  label: '.paddingH(24)',
                  demo: _buildPaddingDemo(
                    color: const Color(0xFF10B981),
                    text: 'Horizontal',
                    paddingType: 'horizontal',
                  ),
                ),
                const SizedBox(height: 12),
                buildCodeCompare(
                  label: '.paddingV(16)',
                  demo: _buildPaddingDemo(
                    color: const Color(0xFFF59E0B),
                    text: 'Vertical',
                    paddingType: 'vertical',
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Center & Align Demo
          buildSection(
            title: 'Alignment Extensions',
            description: '.centered(), .align()',
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E32),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24, width: 1),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                      ),
                      child: const Text(
                        '.centered()',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ).centered(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(color: Colors.white24, width: 1),
                        ),
                      ),
                      child: const Text(
                        '.align(topRight)',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ).align(Alignment.topRight).padding(8),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24, width: 1),
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(16),
                        ),
                      ),
                      child: const Text(
                        '.align(bottomLeft)',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ).align(Alignment.bottomLeft).padding(8),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Size Demo
          buildSection(
            title: 'Sizing Extensions',
            description: '.size(), .square(), .fullWidth()',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          color: const Color(0xFF6366F1),
                        ).square(60).rounded(8),
                        const SizedBox(height: 8),
                        const Text(
                          '.square(60)',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          color: const Color(0xFF10B981),
                        ).size(width: 100, height: 60).rounded(8),
                        const SizedBox(height: 8),
                        const Text(
                          '.size(100, 60)',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '.fullWidth()',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ).centered(),
                ).fullWidth(),
              ],
            ),
          ),

          // Expanded & Flexible Demo
          buildSection(
            title: 'Flex Extensions',
            description: '.expanded(), .flexible()',
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E32),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'flex: 1',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ).centered(),
                  ).expanded(),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'flex: 2',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ).centered(),
                  ).expanded(flex: 2),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF59E0B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'flex: 1',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ).centered(),
                  ).expanded(),
                ],
              ),
            ),
          ),

          // Margin Demo
          buildSection(
            title: 'Margin Extensions',
            description: '.margin(), .marginSymmetric()',
            child: _buildMarginDemo(),
          ),

          const SizedBox(height: 32),
        ],
      ).safeArea(),
    );
  }
}

Widget _buildPaddingDemo({
  required Color color,
  required String text,
  required String paddingType,
  Color textColor = Colors.white,
}) {
  Widget innerBox = Container(
    padding: const EdgeInsets.all(8),
    color: color,
    child: Text(text, style: TextStyle(color: textColor)),
  );

  Widget paddedBox;
  switch (paddingType) {
    case 'horizontal':
      paddedBox = innerBox.paddingH(24);
      break;
    case 'vertical':
      paddedBox = innerBox.paddingV(16);
      break;
    default:
      paddedBox = innerBox.padding(16);
  }

  return Container(color: color.withValues(alpha: 0.3), child: paddedBox);
}

Widget _buildMarginDemo() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1E1E32),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('.margin(16)', style: TextStyle(color: Colors.white)),
    ),
  ).fullWidth();
}
