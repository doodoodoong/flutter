import 'package:flutter_test/flutter_test.dart';
import 'package:first_project/main.dart';

void main() {
  testWidgets('App builds main route', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Main Screen'), findsOneWidget);
  });
}
