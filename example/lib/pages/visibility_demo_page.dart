import 'package:flutter/material.dart';
import 'package:utils_x/utils_x.dart';
import '../widgets/helpers.dart';

/// Demo page for visibility extensions.
class VisibilityDemoPage extends StatefulWidget {
  const VisibilityDemoPage({super.key});

  @override
  State<VisibilityDemoPage> createState() => _VisibilityDemoPageState();
}

class _VisibilityDemoPageState extends State<VisibilityDemoPage> {
  bool _isVisible = true;
  bool _showContent = true;
  bool _isAdmin = true;
  bool _isPointerAbsorbed = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
            title: 'Visibility Extensions',
            subtitle: 'Conditional rendering with animations',
          ),

          // Visible / Gone Demo
          buildSection(
            title: '.visible() & .gone()',
            description: 'Show/hide widgets (with or without space)',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Toggle:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _isVisible,
                      onChanged: (v) => setState(() => _isVisible = v),
                      activeTrackColor: const Color(0xFF6366F1),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                        ).visible(_isVisible),
                        const SizedBox(height: 8),
                        const Text(
                          '.visible()',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        const Text(
                          '(keeps space)',
                          style: TextStyle(color: Colors.white38, fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ).gone(!_isVisible),
                        const SizedBox(height: 8),
                        const Text(
                          '.gone()',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        const Text(
                          '(removes element)',
                          style: TextStyle(color: Colors.white38, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ShowIf Demo
          buildSection(
            title: '.showIf() & .showOrElse()',
            description: 'Conditional rendering helpers',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Is Admin:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _isAdmin,
                      onChanged: (v) => setState(() => _isAdmin = v),
                      activeTrackColor: const Color(0xFFF59E0B),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF59E0B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.admin_panel_settings, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Admin Panel',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ).showIf(_isAdmin),
                const SizedBox(height: 12),
                const Text(
                      'User Content',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    .padding(16)
                    .withBackground(
                      Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(12),
                    )
                    .showOrElse(
                      !_isAdmin,
                      otherwise: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6366F1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Premium Content',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),

          // Animated Visibility Demo
          buildSection(
            title: 'Animated Visibility',
            description: '.fadeVisible(), .scaleVisible(), .slideVisible()',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Show Content:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _showContent,
                      onChanged: (v) => setState(() => _showContent = v),
                      activeTrackColor: const Color(0xFF6366F1),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.opacity, color: Colors.white),
                        ).fadeVisible(_showContent),
                        const SizedBox(height: 8),
                        const Text(
                          '.fadeVisible()',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.zoom_in, color: Colors.white),
                        ).scaleVisible(_showContent),
                        const SizedBox(height: 8),
                        const Text(
                          '.scaleVisible()',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF59E0B),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.swipe_up,
                            color: Colors.black,
                          ),
                        ).slideVisible(_showContent),
                        const SizedBox(height: 8),
                        const Text(
                          '.slideVisible()',
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Pointer Control Demo
          buildSection(
            title: 'Pointer Control',
            description: '.absorbPointer(), .ignorePointer()',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Absorb Pointer:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: _isPointerAbsorbed,
                      onChanged: (v) => setState(() => _isPointerAbsorbed = v),
                      activeTrackColor: const Color(0xFFEC4899),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: _isPointerAbsorbed
                            ? Colors.grey.shade700
                            : const Color(0xFFEC4899),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Try to tap me!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    .onTap(() => showAppSnackbar(context, 'You tapped me!'))
                    .absorbPointer(_isPointerAbsorbed),
                const SizedBox(height: 8),
                Text(
                  _isPointerAbsorbed
                      ? '(Pointer absorbed - cannot tap)'
                      : '(Pointer enabled - tap works)',
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
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
