import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/shared_preferences_data.dart';

class SharedPreferencesToolsDebug {
  static late SharedPreferences _prefs;

  /// Initializes the shared preferences.
  /// This method has no effect on release builds.
  /// Tree shaking will remove all the other methods in this class.
  static Future<void> init() async {
    if (kDebugMode) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  static Set<String> get keys => _prefs.getKeys();

  static Map<String, dynamic> getData(String key) {
    return SharedPreferencesData(_prefs.get(key)).toJson();
  }

  static void changeValue({
    required String key,
    required String value,
    required SharedPreferencesDataType type,
  }) {
    switch (type) {
      case SharedPreferencesDataType.stringList:
        _prefs.setStringList(
          key,
          (jsonDecode(value) as List<dynamic>).cast(),
        );
      case SharedPreferencesDataType.noValue:
        _prefs.remove(key);
      case SharedPreferencesDataType.string:
        _prefs.setString(key, value);
      case SharedPreferencesDataType.int:
        _prefs.setInt(key, int.parse(value));
      case SharedPreferencesDataType.double:
        _prefs.setDouble(key, double.parse(value));
      case SharedPreferencesDataType.bool:
        _prefs.setBool(key, value == 'true');
    }
  }
}
