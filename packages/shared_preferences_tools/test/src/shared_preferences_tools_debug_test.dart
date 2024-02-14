import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_tools/shared_preferences_tools.dart';
import 'package:shared_preferences_tools/src/models/shared_preferences_data.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SharedPreferencesToolsDebug', () {
    test('should get all keys', () async {
      SharedPreferences.setMockInitialValues({
        'key1': 'value1',
        'key2': 'value2',
      });
      await SharedPreferencesToolsDebug.init();

      final prefs = await SharedPreferences.getInstance();

      expect(SharedPreferencesToolsDebug.keys, equals(prefs.getKeys()));
    });

    group('getData', () {
      for (final type in SharedPreferencesDataType.values) {
        // Using a switch ensures that this test will break if a new type is added
        switch (type) {
          case SharedPreferencesDataType.string:
            test('should get string value', () async {
              SharedPreferences.setMockInitialValues({
                'key': 'value',
              });
              await SharedPreferencesToolsDebug.init();

              expect(
                SharedPreferencesToolsDebug.getData('key'),
                equals({
                  'type': 'string',
                  'value': 'value',
                }),
              );
            });
          case SharedPreferencesDataType.int:
            test('should get int value', () async {
              SharedPreferences.setMockInitialValues({
                'key': 42,
              });
              await SharedPreferencesToolsDebug.init();

              expect(
                SharedPreferencesToolsDebug.getData('key'),
                equals({
                  'type': 'int',
                  'value': '42',
                }),
              );
            });
          case SharedPreferencesDataType.double:
            test('should get double value', () async {
              SharedPreferences.setMockInitialValues({
                'key': 3.14,
              });
              await SharedPreferencesToolsDebug.init();

              expect(
                SharedPreferencesToolsDebug.getData('key'),
                equals({
                  'type': 'double',
                  'value': '3.14',
                }),
              );
            });
          case SharedPreferencesDataType.bool:
            test('should get bool value', () async {
              SharedPreferences.setMockInitialValues({
                'key': true,
              });
              await SharedPreferencesToolsDebug.init();

              expect(
                SharedPreferencesToolsDebug.getData('key'),
                equals({
                  'type': 'bool',
                  'value': 'true',
                }),
              );
            });
          case SharedPreferencesDataType.stringList:
            test('should get string list value', () async {
              SharedPreferences.setMockInitialValues({
                'key': ['Hello World 1', 'Hello World 2'],
              });
              await SharedPreferencesToolsDebug.init();

              expect(
                SharedPreferencesToolsDebug.getData('key'),
                equals({
                  'type': 'stringList',
                  'value': '["Hello World 1","Hello World 2"]',
                }),
              );
            });
          case SharedPreferencesDataType.noValue:
            test('should get null value', () async {
              SharedPreferences.setMockInitialValues({});
              await SharedPreferencesToolsDebug.init();

              expect(
                SharedPreferencesToolsDebug.getData('key'),
                equals({
                  'type': 'noValue',
                  'value': 'null',
                }),
              );
            });
        }
      }
    });

    group('change data', () {
      for (final type in SharedPreferencesDataType.values) {
        // Using a switch ensures that this test will break if a new type is added
        switch (type) {
          case SharedPreferencesDataType.string:
            test('should change string value', () async {
              SharedPreferences.setMockInitialValues({});
              await SharedPreferencesToolsDebug.init();
              final prefs = await SharedPreferences.getInstance();

              SharedPreferencesToolsDebug.changeValue(
                key: 'key',
                value: 'value',
                type: SharedPreferencesDataType.string,
              );

              expect(prefs.getString('key'), equals('value'));
            });
          case SharedPreferencesDataType.int:
            test('should change int value', () async {
              SharedPreferences.setMockInitialValues({});
              await SharedPreferencesToolsDebug.init();
              final prefs = await SharedPreferences.getInstance();

              SharedPreferencesToolsDebug.changeValue(
                key: 'key',
                value: '42',
                type: SharedPreferencesDataType.int,
              );

              expect(prefs.getInt('key'), equals(42));
            });
          case SharedPreferencesDataType.double:
            test('should change double value', () async {
              SharedPreferences.setMockInitialValues({});
              await SharedPreferencesToolsDebug.init();
              final prefs = await SharedPreferences.getInstance();

              SharedPreferencesToolsDebug.changeValue(
                key: 'key',
                value: '3.14',
                type: SharedPreferencesDataType.double,
              );

              expect(prefs.getDouble('key'), equals(3.14));
            });
          case SharedPreferencesDataType.bool:
            test('should change bool value', () async {
              SharedPreferences.setMockInitialValues({});
              await SharedPreferencesToolsDebug.init();
              final prefs = await SharedPreferences.getInstance();

              SharedPreferencesToolsDebug.changeValue(
                key: 'key',
                value: 'true',
                type: SharedPreferencesDataType.bool,
              );

              expect(prefs.getBool('key'), equals(true));
            });
          case SharedPreferencesDataType.stringList:
            test('should change string list value', () async {
              SharedPreferences.setMockInitialValues({});
              await SharedPreferencesToolsDebug.init();
              final prefs = await SharedPreferences.getInstance();

              SharedPreferencesToolsDebug.changeValue(
                key: 'key',
                value: '["Hello World 1","Hello World 2"]',
                type: SharedPreferencesDataType.stringList,
              );

              expect(
                prefs.getStringList('key'),
                equals(['Hello World 1', 'Hello World 2']),
              );
            });
          case SharedPreferencesDataType.noValue:
            test('should remove value', () async {
              SharedPreferences.setMockInitialValues({
                'key': 'value',
              });
              await SharedPreferencesToolsDebug.init();
              final prefs = await SharedPreferences.getInstance();

              SharedPreferencesToolsDebug.changeValue(
                key: 'key',
                value: '', // the value is not used
                type: SharedPreferencesDataType.noValue,
              );

              expect(prefs.containsKey('key'), isFalse);
            });
        }
      }
    });
  });
}
