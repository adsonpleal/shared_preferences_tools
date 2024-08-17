@TestOn('browser')
library;

import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_tools/src/ui/error_panel.dart';

void main() {
  group('ErrorPanel', () {
    testWidgets(
      'should show error and stacktrace',
      (WidgetTester tester) async {
        const String error = 'error';
        final StackTrace stackTrace = StackTrace.current;

        await tester.pumpWidget(
          DevToolsExtension(
            requiresRunningApplication: false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: ErrorPanel(
                error: error,
                stackTrace: stackTrace,
              ),
            ),
          ),
        );

        expect(find.text('Error:\n$error\n\n$stackTrace'), findsOneWidget);
      },
    );
  });
}
