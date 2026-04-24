import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asthma_monitor/screens/login_screen.dart';

void main() {
  testWidgets('Login screen renders key UI elements', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(find.text('Welcome to Asthma Monitor'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Login'), findsOneWidget);
  });
}
