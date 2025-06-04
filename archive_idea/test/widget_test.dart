import 'package:flutter_test/flutter_test.dart';
import 'package:archive_idea/main.dart';

void main() {
  testWidgets('App builds main route', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Archive Idea'), findsWidgets);
  });
}
