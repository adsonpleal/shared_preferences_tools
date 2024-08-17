@TestOn('browser')
library;

import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_tools/src/shared_preferences_state_provider.dart';
import 'package:shared_preferences_tools/src/ui/data_panel.dart';
import 'package:shared_preferences_tools/src/ui/keys_panel.dart';
import 'package:shared_preferences_tools/src/ui/shared_preferences_body.dart';

import '../../test_helpers/notifier_mocking_helpers.dart';
import '../../test_helpers/notifier_mocking_helpers.mocks.dart';

void main() {
  group('group name', () {
    setupDummies();

    testWidgets(
      'should show keys and data panels',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          DevToolsExtension(
            requiresRunningApplication: false,
            child: InnerSharedPreferencesStateProvider(
              notifier: MockSharedPreferencesStateNotifier(),
              child: const SharedPreferencesBody(),
            ),
          ),
        );

        expect(find.byType(KeysPanel), findsOneWidget);
        expect(find.byType(DataPanel), findsOneWidget);
      },
    );
  });
}
