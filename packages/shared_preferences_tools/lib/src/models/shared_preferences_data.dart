import 'dart:convert';
import 'dart:core' as core;

enum SharedPreferencesDataType {
  string,
  int,
  double,
  bool,
  stringList,
  noValue,
  ;

  static SharedPreferencesDataType fromName(core.String name) {
    return SharedPreferencesDataType.values.firstWhere((e) => e.name == name);
  }

  static SharedPreferencesDataType fromObject(core.Object? object) {
    if (object == null) {
      return noValue;
    } else if (object is core.String) {
      return string;
    } else if (object is core.int) {
      return int;
    } else if (object is core.double) {
      return double;
    } else if (object is core.bool) {
      return bool;
    } else if (object is core.List<core.String>) {
      return stringList;
    } else {
      throw core.ArgumentError('Unsupported type: $object');
    }
  }

  core.String get prettyName {
    return switch (this) {
      string => 'String',
      int => 'int',
      double => 'double',
      bool => 'bool',
      stringList => 'List<String>',
      noValue => 'null',
    };
  }
}

class SharedPreferencesData {
  factory SharedPreferencesData(
    core.Object? value,
  ) {
    final type = SharedPreferencesDataType.fromObject(value);
    return SharedPreferencesData._(
      switch (type) {
        SharedPreferencesDataType.stringList => jsonEncode(value),
        _ => value.toString(),
      },
      type,
    );
  }

  SharedPreferencesData._(
    this.value,
    this.type,
  );

  SharedPreferencesData.fromValueAndType(this.value, core.String type)
      : type = SharedPreferencesDataType.fromName(type);

  final core.String value;
  final SharedPreferencesDataType type;

  core.String get prettyValue {
    if (type == SharedPreferencesDataType.noValue) {
      return 'null';
    } else if (type == SharedPreferencesDataType.stringList) {
      return '\n${(jsonDecode(value) as core.List<core.dynamic>).cast<core.String>().join('\n')}';
    } else {
      return value;
    }
  }

  core.Map<core.String, core.String> toJson() {
    return <core.String, core.String>{
      'value': value,
      'type': type.name,
    };
  }
}
