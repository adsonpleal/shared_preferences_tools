import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_tools/shared_preferences_tools.dart';

Future<void> _setInitialValues() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getKeys().isNotEmpty) {
    return;
  }

  await Future.wait([
    prefs.setString('someStringKey', 'Hello, world!'),
    prefs.setString(
      'someSerializedMapKey',
      jsonEncode(
        {
          'key1': 'value1',
          'key2': 'value2',
          'intKey1': 42,
          'doubleKey1': 3.14,
          'boolKey1': true,
        },
      ),
    ),
    prefs.setInt('someIntKey', 42),
    prefs.setDouble('someDoubleKey', 3.14),
    prefs.setBool('someBoolKey', true),
    prefs.setStringList(
      'someStringListKey',
      ['Hello World 1', 'Hello World 2'],
    ),
  ]);
}

Future<void> main() async {
  await SharedPreferencesToolsDebug.init();

  await _setInitialValues();

  runApp(const SharedPreferencesToolsExample());
}

class SharedPreferencesToolsExample extends StatelessWidget {
  const SharedPreferencesToolsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Tools Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: _Content(),
      ),
    );
  }
}

class _Content extends HookWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final prefs = useFuture(SharedPreferences.getInstance()).data;
    final loadingState = useState(false);

    if (prefs == null || loadingState.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('someStringKey: ${prefs.getString('someStringKey')}'),
              const SizedBox(height: 8),
              Text(
                'someSerializedMapKey: ${prefs.getString('someSerializedMapKey')}',
              ),
              const SizedBox(height: 8),
              Text('someIntKey: ${prefs.getInt('someIntKey')}'),
              const SizedBox(height: 8),
              Text('someDoubleKey: ${prefs.getDouble('someDoubleKey')}'),
              const SizedBox(height: 8),
              Text('someBoolKey: ${prefs.getBool('someBoolKey')}'),
              const SizedBox(height: 8),
              Text(
                'someStringListKey: ${prefs.getStringList('someStringListKey')}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
