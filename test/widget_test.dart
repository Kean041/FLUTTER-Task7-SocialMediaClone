import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:social_media_clone/main.dart';
import 'package:social_media_clone/socialmedia.dart';

void main() {
  testWidgets('login screen is shown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('TIKTOKTOK'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('a comment is saved to and shown on its post', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: Socialmedia()));

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -1000));
    await tester.pumpAndSettle();

    final commentField = find.byType(TextField).first;
    await tester.ensureVisible(find.text('Add').first);
    await tester.pumpAndSettle();
    await tester.enterText(commentField, 'A saved comment');
    await tester.tap(find.text('Add').first);
    await tester.pumpAndSettle();

    expect(find.text('A saved comment'), findsOneWidget);
    expect(find.text('25 Comments'), findsOneWidget);
  });

  testWidgets('social feed scrolls to the last post on a phone-width screen', (
    WidgetTester tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MaterialApp(home: Socialmedia()));

    await tester.scrollUntilVisible(
      find.text('Johnson Stewart'),
      500,
      scrollable: find
          .descendant(
            of: find.byType(CustomScrollView),
            matching: find.byType(Scrollable),
          )
          .first,
    );

    expect(find.text('Johnson Stewart'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
