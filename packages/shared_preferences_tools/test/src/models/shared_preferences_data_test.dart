import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences_tools/shared_preferences_tools.dart';

void main() {
  group('SharedPreferencesDataType', () {
    test('should get SharedPreferencesDataType from name', () {
      for (final type in SharedPreferencesDataType.values) {
        void expectName(String name) {
          expect(
            SharedPreferencesDataType.fromName(name),
            equals(type),
          );
        }

        // Using a switch ensures that this test will break if a new type is added
        switch (type) {
          case SharedPreferencesDataType.string:
            expectName('string');
          case SharedPreferencesDataType.int:
            expectName('int');
          case SharedPreferencesDataType.double:
            expectName('double');
          case SharedPreferencesDataType.bool:
            expectName('bool');
          case SharedPreferencesDataType.stringList:
            expectName('stringList');
          case SharedPreferencesDataType.noValue:
            expectName('noValue');
        }
      }
    });

    test('should get SharedPreferencesDataType from object', () {
      for (final type in SharedPreferencesDataType.values) {
        void expectObject(Object? object) {
          expect(
            SharedPreferencesDataType.fromObject(object),
            equals(type),
          );
        }

        // Using a switch ensures that this test will break if a new type is added
        switch (type) {
          case SharedPreferencesDataType.string:
            expectObject('Hello, world!');
          case SharedPreferencesDataType.int:
            expectObject(42);
          case SharedPreferencesDataType.double:
            expectObject(3.14);
          case SharedPreferencesDataType.bool:
            expectObject(true);
          case SharedPreferencesDataType.stringList:
            expectObject(['Hello World 1', 'Hello World 2']);
          case SharedPreferencesDataType.noValue:
            expectObject(null);
        }
      }

      expect(
        () => SharedPreferencesDataType.fromObject(Object()),
        throwsArgumentError,
      );
    });

    test('should get pretty name', () {
      for (final type in SharedPreferencesDataType.values) {
        void expectPrettyName(String name) {
          expect(
            type.prettyName,
            equals(name),
          );
        }

        // Using a switch ensures that this test will break if a new type is added
        switch (type) {
          case SharedPreferencesDataType.string:
            expectPrettyName('String');
          case SharedPreferencesDataType.int:
            expectPrettyName('int');
          case SharedPreferencesDataType.double:
            expectPrettyName('double');
          case SharedPreferencesDataType.bool:
            expectPrettyName('bool');
          case SharedPreferencesDataType.stringList:
            expectPrettyName('List<String>');
          case SharedPreferencesDataType.noValue:
            expectPrettyName('null');
        }
      }
    });
  });

  group('SharedPreferencesData', () {
    test('should create SharedPreferencesData', () {
      for (final expectedType in SharedPreferencesDataType.values) {
        void expectData({
          required Object? value,
          required String expectedValue,
        }) {
          final data = SharedPreferencesData(value);
          expect(data.type, equals(expectedType));
          expect(data.value, equals(expectedValue));
        }

        // Using a switch ensures that this test will break if a new type is added
        switch (expectedType) {
          case SharedPreferencesDataType.string:
            expectData(
              value: 'Hello, world!',
              expectedValue: 'Hello, world!',
            );
          case SharedPreferencesDataType.int:
            expectData(
              value: 42,
              expectedValue: '42',
            );
          case SharedPreferencesDataType.double:
            expectData(
              value: 3.14,
              expectedValue: '3.14',
            );
          case SharedPreferencesDataType.bool:
            expectData(
              value: true,
              expectedValue: 'true',
            );
          case SharedPreferencesDataType.stringList:
            expectData(
              value: ['Hello World 1', 'Hello World 2'],
              expectedValue: '["Hello World 1","Hello World 2"]',
            );
          case SharedPreferencesDataType.noValue:
            expectData(
              value: null,
              expectedValue: 'null',
            );
        }
      }

      expect(() => SharedPreferencesData(Object()), throwsArgumentError);
    });

    test('should create SharedPreferencesData from value and type', () {
      for (final expectedType in SharedPreferencesDataType.values) {
        void expectData({
          required String value,
          required String type,
          required String expectedValue,
        }) {
          final data = SharedPreferencesData.fromValueAndType(value, type);
          expect(data.type, equals(expectedType));
          expect(data.value, equals(expectedValue));
        }

        // Using a switch ensures that this test will break if a new type is added
        switch (expectedType) {
          case SharedPreferencesDataType.string:
            expectData(
              value: 'Hello, world!',
              type: 'string',
              expectedValue: 'Hello, world!',
            );
          case SharedPreferencesDataType.int:
            expectData(
              value: '42',
              type: 'int',
              expectedValue: '42',
            );
          case SharedPreferencesDataType.double:
            expectData(
              value: '3.14',
              type: 'double',
              expectedValue: '3.14',
            );
          case SharedPreferencesDataType.bool:
            expectData(
              value: 'true',
              type: 'bool',
              expectedValue: 'true',
            );
          case SharedPreferencesDataType.stringList:
            expectData(
              value: '["Hello World 1","Hello World 2"]',
              type: 'stringList',
              expectedValue: '["Hello World 1","Hello World 2"]',
            );
          case SharedPreferencesDataType.noValue:
            expectData(
              value: 'null',
              type: 'noValue',
              expectedValue: 'null',
            );
        }
      }

      expect(
        () => SharedPreferencesData.fromValueAndType(
          'Hello, world!',
          'unsupported',
        ),
        throwsStateError,
      );
    });

    test('should convert to json map', () {
      for (final type in SharedPreferencesDataType.values) {
        void expectJsonMap({
          required Object? value,
          required Map<String, dynamic> expectedMap,
        }) {
          final data = SharedPreferencesData(value);
          expect(data.toJson(), equals(expectedMap));
        }

        // Using a switch ensures that this test will break if a new type is added
        switch (type) {
          case SharedPreferencesDataType.string:
            expectJsonMap(
              value: 'Hello, world!',
              expectedMap: {
                'value': 'Hello, world!',
                'type': 'string',
              },
            );
          case SharedPreferencesDataType.int:
            expectJsonMap(
              value: 42,
              expectedMap: {
                'value': '42',
                'type': 'int',
              },
            );
          case SharedPreferencesDataType.double:
            expectJsonMap(
              value: 3.14,
              expectedMap: {
                'value': '3.14',
                'type': 'double',
              },
            );
          case SharedPreferencesDataType.bool:
            expectJsonMap(
              value: true,
              expectedMap: {
                'value': 'true',
                'type': 'bool',
              },
            );
          case SharedPreferencesDataType.stringList:
            expectJsonMap(
              value: ['Hello World 1', 'Hello World 2'],
              expectedMap: {
                'value': '["Hello World 1","Hello World 2"]',
                'type': 'stringList',
              },
            );
          case SharedPreferencesDataType.noValue:
            expectJsonMap(
              value: null,
              expectedMap: {
                'value': 'null',
                'type': 'noValue',
              },
            );
        }
      }
    });
  });
}
