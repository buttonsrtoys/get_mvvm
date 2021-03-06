import 'package:example/increment_button/increment_button.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('a'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(IncrementButton));
    await tester.pump();

    expect(find.text('a'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byType(IncrementButton));
    await tester.pump();

    expect(find.text('b'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });
}
