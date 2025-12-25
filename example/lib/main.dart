import 'package:flutter/material.dart';
import 'package:utils_x/utils_x.dart';

void main() {
  runApp(const UtilsXExampleApp());
}

class UtilsXExampleApp extends StatelessWidget {
  const UtilsXExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utils X Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    InteractionDemoPage(),
    LayoutDemoPage(),
    StylingDemoPage(),
    VisibilityDemoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: const Color(0xFF6366F1).withValues(alpha: 0.2),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) =>
              setState(() => _selectedIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.touch_app_outlined),
              selectedIcon: Icon(Icons.touch_app),
              label: 'Interactions',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_quilt_outlined),
              selectedIcon: Icon(Icons.view_quilt),
              label: 'Layout',
            ),
            NavigationDestination(
              icon: Icon(Icons.palette_outlined),
              selectedIcon: Icon(Icons.palette),
              label: 'Styling',
            ),
            NavigationDestination(
              icon: Icon(Icons.visibility_outlined),
              selectedIcon: Icon(Icons.visibility),
              label: 'Visibility',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================
// INTERACTION DEMO PAGE
// ============================================
class InteractionDemoPage extends StatelessWidget {
  const InteractionDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: 'Interaction Extensions',
            subtitle: 'Add press effects, taps, and gestures',
          ),

          // Press Effect Demo
          _buildSection(
            title: '.pressEffect()',
            description: 'Scale-down animation on press - TRY PRESSING!',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDemoCard(
                  color: const Color(0xFF6366F1),
                  icon: Icons.favorite,
                  label: 'Like',
                ).pressEffect(
                  scale: 0.85, // More visible scale
                  onTap: () => _showSnackbar(context, 'Liked!'),
                ),
                _buildDemoCard(
                  color: const Color(0xFF10B981),
                  icon: Icons.share,
                  label: 'Share',
                ).pressEffect(
                  scale: 0.8, // More visible scale
                  onTap: () => _showSnackbar(context, 'Shared!'),
                ),
                _buildDemoCard(
                  color: const Color(0xFFF59E0B),
                  icon: Icons.bookmark,
                  label: 'Save',
                ).pressEffect(
                  scale: 0.75, // Most visible scale
                  duration: const Duration(milliseconds: 150),
                  onTap: () => _showSnackbar(context, 'Saved!'),
                ),
              ],
            ),
          ),

          // Simple Tap Demo
          _buildSection(
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
            ).onTap(() => _showSnackbar(context, 'Tapped!')),
          ),

          // Ripple Effect Demo
          _buildSection(
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
                  onTap: () => _showSnackbar(context, 'Ripple!'),
                  splashColor: const Color(0xFF6366F1).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
          ),

          // Hover Scale Demo
          _buildSection(
            title: '.hoverScale()',
            description: 'Scale up on hover (web/desktop)',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMiniCard('1.05x', Colors.purple).hoverScale(1.05),
                _buildMiniCard('1.1x', Colors.blue).hoverScale(1.1),
                _buildMiniCard('1.15x', Colors.teal).hoverScale(1.15),
              ],
            ),
          ),

          // Gesture Handlers Demo
          _buildSection(
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
                ).onLongPress(() => _showSnackbar(context, 'Long Pressed!')),
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
                ).onDoubleTap(() => _showSnackbar(context, 'Double Tapped!')),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ).safeArea(),
    );
  }
}

// ============================================
// LAYOUT DEMO PAGE
// ============================================
class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: 'Layout Extensions',
            subtitle: 'Padding, centering, sizing shortcuts',
          ),

          // Padding Demo
          _buildSection(
            title: 'Padding Extensions',
            description: '.padding(), .paddingH(), .paddingV()',
            child: Column(
              children: [
                _buildCodeCompare(
                  label: '.padding(16)',
                  demo: _buildPaddingDemo(
                    color: const Color(0xFF6366F1),
                    text: 'All',
                    paddingType: 'all',
                  ),
                ),
                const SizedBox(height: 12),
                _buildCodeCompare(
                  label: '.paddingH(24)',
                  demo: _buildPaddingDemo(
                    color: const Color(0xFF10B981),
                    text: 'Horizontal',
                    paddingType: 'horizontal',
                  ),
                ),
                const SizedBox(height: 12),
                _buildCodeCompare(
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
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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

// ============================================
// STYLING DEMO PAGE
// ============================================
class StylingDemoPage extends StatelessWidget {
  const StylingDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(
            title: 'Styling Extensions',
            subtitle: 'Shadows, gradients, borders, effects',
          ),

          // Rounded Corners Demo
          _buildSection(
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
          _buildSection(
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
                ).glow(
                  // color: const Color(0xFF6366F1),
                  // blur: 25,
                  // spreadRadius: 2,
                  // borderRadius: BorderRadius.circular(12),
                ),
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
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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

// ============================================
// VISIBILITY DEMO PAGE
// ============================================
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
          _buildHeader(
            title: 'Visibility Extensions',
            subtitle: 'Conditional rendering with animations',
          ),

          // Visible / Gone Demo
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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
          _buildSection(
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
                    .onTap(() => _showSnackbar(context, 'You tapped me!'))
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

// ============================================
// HELPER WIDGETS & FUNCTIONS
// ============================================

Widget _buildHeader({required String title, required String subtitle}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color(0xFF6366F1).withValues(alpha: 0.3),
          Colors.transparent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    padding: const EdgeInsets.all(45),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSection({
  required String title,
  required String description,
  required Widget child,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1A1A2E),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6366F1),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.5),
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    ),
  );
}

Widget _buildDemoCard({
  required Color color,
  required IconData icon,
  required String label,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget _buildMiniCard(String label, Color color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
  );
}

Widget _buildCodeCompare({required String label, required Widget demo}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Color(0xFF10B981),
            ),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Expanded(flex: 3, child: demo),
    ],
  );
}

void _showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFF6366F1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 1),
    ),
  );
}
