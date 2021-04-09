import 'package:flutter/material.dart';
import 'package:flutter_helloworld/demo/test_demo/test_demo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test 11111', () {
    var string = MyTestDemo.greet('liubang');
    expect(string, 'hello liubang1111');
  });
  testWidgets('widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestDemo(),
    ));

    final labelText = find.text('hello');
    // expect(labelText, findsNothing);
    expect(labelText, findsOneWidget);

    final actionChipLabelText = find.text('0');
    expect(actionChipLabelText, findsOneWidget);

    final actionChip = find.byType(ActionChip);
    await tester.tap(actionChip);
    await tester.pump();

    final actionChipTap = find.text('1');
    expect(actionChipTap, findsOneWidget);
    expect(actionChipLabelText, findsNothing);
  });
}
