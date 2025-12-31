import 'package:flutter/material.dart';

import 'pages/interaction_demo_page.dart';
import 'pages/layout_demo_page.dart';
import 'pages/styling_demo_page.dart';
import 'pages/visibility_demo_page.dart';
import 'pages/new_features_demo_page.dart';

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
    NewFeaturesDemoPage(),
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
            NavigationDestination(
              icon: Icon(Icons.new_releases_outlined),
              selectedIcon: Icon(Icons.new_releases),
              label: 'v1.1.0',
            ),
          ],
        ),
      ),
    );
  }
}
