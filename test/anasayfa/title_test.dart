
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todo_app/ui/views/anasayfa.dart';
import 'package:todo_app/main.dart' as app;

void main() {
  group("app test", ()
  {IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('full app test',
            (WidgetTester tester) async {
          // Arrange
          app.main();
          tester.pumpAndSettle();

          // Assert
          expect(find.byIcon(Icons.search), findsOneWidget);
        });
  } );
}