import 'package:devtools_app_shared/ui.dart';
import 'package:devtools_app_shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences_tools/shared_preferences_tools.dart';
import 'package:shared_preferences_tools_devtools_extension/src/presentation/shared_preferences_tools_body.dart';
import 'package:shared_preferences_tools_devtools_extension/src/providers/change_value_provider.dart';
import 'package:shared_preferences_tools_devtools_extension/src/providers/data_provider.dart';
import 'package:shared_preferences_tools_devtools_extension/src/providers/keys_provider.dart';

@GenerateNiceMocks([MockSpec<FakeChangeValue>()])
import 'shared_preferences_tools_body_test.mocks.dart';

class FakeChangeValue {
  Future<void> call({
    required String key,
    String value = '',
    required SharedPreferencesDataType type,
  }) async {}
}

void main() {
  group('SharedPreferencesToolsBody', () {
    testWidgets('should show keys list', (tester) async {
      const keys = ['key1', 'key2'];

      await tester.pumpScreenWithOverrides(
        overrides: [
          keysProvider.overrideWith((ref) => keys),
          changeValueProvider.overrideWith((ref) => FakeChangeValue()),
        ],
      );
      await tester.pump();

      for (final key in keys) {
        expect(find.text(key), findsOneWidget);
      }
    });

    testWidgets('should show selected key data', (tester) async {
      const selectedKey = 'key1';
      await tester.pumpScreenWithOverrides(
        overrides: [
          keysProvider.overrideWith((ref) => [selectedKey]),
          changeValueProvider.overrideWith((ref) => FakeChangeValue()),
          sharedPreferencesDataProvider(selectedKey).overrideWith(
            (provider) => SharedPreferencesData(42),
          ),
        ],
      );
      await tester.pump();

      await tester.tap(find.text(selectedKey));
      await tester.pumpAndSettle();

      // list item and data panel title
      expect(find.text(selectedKey), findsNWidgets(2));
      expect(find.text('Type: int'), findsOneWidget);
      expect(find.text('Value: 42'), findsOneWidget);
    });

    testWidgets('should call refresh on refresh tap', (tester) async {
      const selectedKey = 'key1';
      await tester.pumpScreenWithOverrides(
        overrides: [
          keysProvider.overrideWith((ref) => [selectedKey]),
          changeValueProvider.overrideWith((ref) => FakeChangeValue()),
          sharedPreferencesDataProvider(selectedKey).overrideWith(
            (provider) => SharedPreferencesData(42),
          ),
        ],
      );
      await tester.pump();

      await tester.tap(find.text(selectedKey));
      await tester.pumpAndSettle();

      // list item and data panel title
      expect(find.text(selectedKey), findsNWidgets(2));
      expect(find.text('Type: int'), findsOneWidget);
      expect(find.text('Value: 42'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();

      expect(find.text(selectedKey), findsOneWidget);
      expect(find.text('Type: int'), findsNothing);
      expect(find.text('Value: 42'), findsNothing);
    });

    group('selected panel', () {
      testWidgets('should cancel changes on cancel', (tester) async {
        const selectedKey = 'key1';
        await tester.pumpScreenWithOverrides(
          overrides: [
            keysProvider.overrideWith((ref) => [selectedKey]),
            changeValueProvider.overrideWith((ref) => FakeChangeValue()),
            sharedPreferencesDataProvider(selectedKey).overrideWith(
              (provider) => SharedPreferencesData(42),
            ),
          ],
        );
        await tester.pump();

        await tester.tap(find.text(selectedKey));
        await tester.pumpAndSettle();

        expect(find.text(selectedKey), findsNWidgets(2));
        expect(find.text('Type: int'), findsOneWidget);
        expect(find.text('Value: 42'), findsOneWidget);

        await tester.tap(find.text('Edit'));
        await tester.pump();

        await tester.enterText(find.byType(TextField), '43');
        await tester.pump();

        await tester.tap(find.text('Cancel'));
        await tester.pump();

        expect(find.text(selectedKey), findsNWidgets(2));
        expect(find.text('Type: int'), findsOneWidget);
        expect(find.text('Value: 42'), findsOneWidget);
      });

      testWidgets('should save changes on commit', (tester) async {
        const selectedKey = 'key1';
        final changeValueMock = MockFakeChangeValue();
        await tester.pumpScreenWithOverrides(
          overrides: [
            keysProvider.overrideWith((ref) => [selectedKey]),
            changeValueProvider.overrideWith((ref) => changeValueMock),
            sharedPreferencesDataProvider(selectedKey).overrideWith(
              (provider) => SharedPreferencesData(42),
            ),
          ],
        );
        await tester.pump();

        await tester.tap(find.text(selectedKey));
        await tester.pumpAndSettle();

        expect(find.text(selectedKey), findsNWidgets(2));
        expect(find.text('Type: int'), findsOneWidget);
        expect(find.text('Value: 42'), findsOneWidget);

        await tester.tap(find.text('Edit'));
        await tester.pump();

        await tester.enterText(find.byType(TextField), '43');
        await tester.pump();

        await tester.tap(find.text('Commit changes'));
        await tester.pump();

        verify(
          changeValueMock(
            key: selectedKey,
            value: '43',
            type: SharedPreferencesDataType.int,
          ),
        ).called(1);
      });
    });

    group('search', () {
      testWidgets(
        'should show nothing when search token does not match keys',
        (tester) async {
          const keys = ['key1', 'key2'];
          await tester.pumpScreenWithOverrides(
            overrides: [
              keysProvider.overrideWith((ref) => keys),
              changeValueProvider.overrideWith((ref) => FakeChangeValue()),
            ],
          );
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }

          await tester.tap(find.byIcon(Icons.search));
          await tester.pump();

          await tester.enterText(find.byType(TextField), 'key3');
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsNothing);
          }
        },
      );

      testWidgets(
        'should clear search on refresh',
        (tester) async {
          const keys = ['key1', 'key2'];
          await tester.pumpScreenWithOverrides(
            overrides: [
              keysProvider.overrideWith((ref) => keys),
              changeValueProvider.overrideWith((ref) => FakeChangeValue()),
            ],
          );
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }

          await tester.tap(find.byIcon(Icons.search));
          await tester.pump();

          await tester.enterText(find.byType(TextField), 'key3');
          await tester.pump();

          await tester.tap(find.byIcon(Icons.refresh));
          await tester.pump();

          expect(find.byType(TextField), findsNothing);
          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }
        },
      );

      testWidgets(
        'should show only matching keys when search token matches keys',
        (tester) async {
          const matchingKeys = ['key11', 'key12'];
          const otherKeys = ['key22', 'key23'];
          const allKeys = [...matchingKeys, ...otherKeys];
          await tester.pumpScreenWithOverrides(
            overrides: [
              keysProvider.overrideWith((ref) => allKeys),
              changeValueProvider.overrideWith((ref) => FakeChangeValue()),
            ],
          );
          await tester.pump();

          for (final key in allKeys) {
            expect(find.text(key), findsOneWidget);
          }

          await tester.tap(find.byIcon(Icons.search));
          await tester.pump();

          await tester.enterText(find.byType(TextField), 'key1');
          await tester.pump();

          for (final key in matchingKeys) {
            expect(find.text(key), findsOneWidget);
          }
          for (final key in otherKeys) {
            expect(find.text(key), findsNothing);
          }
        },
      );

      testWidgets(
        'should close search and clear search token on close tap',
        (tester) async {
          const keys = ['key1', 'key2'];
          await tester.pumpScreenWithOverrides(
            overrides: [
              keysProvider.overrideWith((ref) => keys),
              changeValueProvider.overrideWith((ref) => FakeChangeValue()),
            ],
          );
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }

          await tester.tap(find.byIcon(Icons.search));
          await tester.pump();

          await tester.enterText(find.byType(TextField), 'key3');
          await tester.pump();

          await tester.tap(find.byIcon(Icons.close));
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }
        },
      );

      testWidgets(
        'should close search and clear search token on Esc pressed',
        (tester) async {
          const keys = ['key1', 'key2'];
          await tester.pumpScreenWithOverrides(
            overrides: [
              keysProvider.overrideWith((ref) => keys),
              changeValueProvider.overrideWith((ref) => FakeChangeValue()),
            ],
          );
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }

          await tester.tap(find.byIcon(Icons.search));
          await tester.pump();

          await tester.enterText(find.byType(TextField), 'key3');
          await tester.pump();

          await tester.sendKeyEvent(LogicalKeyboardKey.escape);
          await tester.pump();

          for (final key in keys) {
            expect(find.text(key), findsOneWidget);
          }
        },
      );
    });
  });
}

extension on WidgetTester {
  Future<void> pumpScreenWithOverrides({
    required List<Override> overrides,
  }) async {
    setGlobal(IdeTheme, getIdeTheme());
    await pumpWidget(
      MaterialApp(
        theme: themeFor(
          isDarkTheme: false,
          ideTheme: IdeTheme(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
        ),
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            body: ProviderScope(
              overrides: overrides,
              child: const SharedPreferencesToolsBody(),
            ),
          ),
        ),
      ),
    );
  }
}
