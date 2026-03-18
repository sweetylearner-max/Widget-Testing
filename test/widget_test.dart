import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_demo/main.dart';

void main() {
  // ── Test 1: Initial counter is 0 ──
  testWidgets('Initial counter value is 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Count: 0'), findsOneWidget);
  });

  // ── Test 2: Increment ──
  testWidgets('Counter increments when button tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();
    expect(find.text('Count: 1'), findsOneWidget);
  });

  // ── Test 3: Decrement ──
  testWidgets('Counter decrements when button tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // First increment to 2
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();
    expect(find.text('Count: 2'), findsOneWidget);

    // Then decrement
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.pump();
    expect(find.text('Count: 1'), findsOneWidget);
  });

  // ── Test 4: Reset ──
  testWidgets('Counter resets to 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Increment 3 times
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();
    expect(find.text('Count: 3'), findsOneWidget);

    // Reset
    await tester.tap(find.byKey(const Key('resetButton')));
    await tester.pump();
    expect(find.text('Count: 0'), findsOneWidget);
  });

  // ── Test 5: Count never goes below 0 ──
  testWidgets('Counter never goes below 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Try to decrement at 0
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.pump();
    expect(find.text('Count: 0'), findsOneWidget);
  });
}