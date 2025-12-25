import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utils_x/utils_x.dart';

void main() {
  group('Layout Extensions', () {
    testWidgets('padding adds EdgeInsets.all', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').padding(16)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, equals(const EdgeInsets.all(16)));
    });

    testWidgets('paddingH adds horizontal padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').paddingH(20)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        equals(const EdgeInsets.symmetric(horizontal: 20)),
      );
    });

    testWidgets('centered wraps with Center', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('Test').centered()));

      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('expanded wraps with Expanded', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Row(children: [const Text('Test').expanded()])),
      );

      expect(find.byType(Expanded), findsOneWidget);
    });
  });

  group('Styling Extensions', () {
    testWidgets('rounded applies ClipRRect', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Container().rounded(12)));

      final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipRRect.borderRadius, equals(BorderRadius.circular(12)));
    });

    testWidgets('circular applies ClipOval', (tester) async {
      await tester.pumpWidget(MaterialApp(home: Container().circular()));

      expect(find.byType(ClipOval), findsOneWidget);
    });

    testWidgets('opacity applies Opacity widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').opacity(0.5)),
      );

      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, equals(0.5));
    });
  });

  group('Visibility Extensions', () {
    testWidgets('gone removes widget when condition is true', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('Test').gone(true)));

      expect(find.text('Test'), findsNothing);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('gone shows widget when condition is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').gone(false)),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('showIf shows widget when condition is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').showIf(true)),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('showIf hides widget when condition is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').showIf(false)),
      );

      expect(find.text('Test'), findsNothing);
    });
  });

  group('Interaction Extensions', () {
    testWidgets('onTap adds GestureDetector', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').onTap(() => tapped = true)),
      );

      await tester.tap(find.text('Test'));
      expect(tapped, isTrue);
    });

    testWidgets('pressEffect adds PressEffectWidget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').pressEffect()),
      );

      expect(find.byType(PressEffectWidget), findsOneWidget);
    });
  });

  group('Widget Extensions', () {
    testWidgets('tooltip adds Tooltip widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').tooltip('Hint')),
      );

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('hero adds Hero widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').hero('test_tag')),
      );

      final hero = tester.widget<Hero>(find.byType(Hero));
      expect(hero.tag, equals('test_tag'));
    });
  });
}
