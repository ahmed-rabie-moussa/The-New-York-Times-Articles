import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyt/main.dart';

void main() {
  testWidgets('Home Page widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    var progressInd = find.byType(CircularProgressIndicator);
    expect(progressInd, findsOneWidget);
    var icons = find.byType(Icon);
    expect(icons, findsNWidgets(3));
    final titleFinder = find.text('NY Times Most Popular Articles');
    expect(titleFinder, findsOneWidget);
  });
}
