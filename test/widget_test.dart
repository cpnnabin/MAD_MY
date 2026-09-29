import 'package:flutter_test/flutter_test.dart';
import 'package:demopcpsseca/main.dart';

void main() {
  testWidgets('App renders login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the login screen loads with expected title and login button.
    expect(find.text('Flutter Buttons & Navigation'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
