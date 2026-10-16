import 'package:flutter_test/flutter_test.dart';
import 'package:passguard/main.dart';

void main() {

  testWidgets('PassGuard UI Test', (WidgetTester tester) async {

    // Start PassGuard application
    await tester.pumpWidget(const PassGuardApp());

    // Check application title
    expect(
      find.text('PassGuard'),
      findsOneWidget,
    );

    // Check password input field
    expect(
      find.text('Enter Password'),
      findsOneWidget,
    );

    // Check strength button
    expect(
      find.text('Check Strength'),
      findsOneWidget,
    );

  });

}