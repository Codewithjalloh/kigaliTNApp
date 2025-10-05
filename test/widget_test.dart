// This is a basic Flutter widget test for the Kigali Today app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:kigalitoday/main.dart';
import 'package:kigalitoday/providers/news_provider.dart';

void main() {
  testWidgets('Kigali Today app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const KigaliTodayApp());

    // Verify that the app loads without crashing
    expect(find.text('Kigali Today'), findsOneWidget);
  });
}
