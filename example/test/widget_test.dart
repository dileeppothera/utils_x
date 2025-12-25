// Basic widget test for Utils X Example App

import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Utils X Example App renders correctly', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const UtilsXExampleApp());

    // Verify that the app loads with the Interactions page header
    expect(find.text('Interaction Extensions'), findsOneWidget);
  });
}
