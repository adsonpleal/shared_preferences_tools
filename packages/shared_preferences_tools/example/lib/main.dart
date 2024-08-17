// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _setInitialValues() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getKeys().isNotEmpty) {
    return;
  }

  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  await <Future<void>>[
    prefs.setString('someStringKey', 'Hello, world!'),
    prefs.setInt('someIntKey', 42),
    prefs.setDouble('someDoubleKey', 3.14),
    prefs.setBool('someBoolKey', true),
    prefs.setStringList(
      'someStringListKey',
      <String>['Hello World 1', 'Hello World 2'],
    ),
    asyncPrefs.setString('asyncStringKey', 'Hello, async world!'),
    asyncPrefs.setInt('asyncIntKey', 24),
    asyncPrefs.setDouble('asyncDoubleKey', 1.41),
    asyncPrefs.setBool('asyncBoolKey', false),
    asyncPrefs.setStringList(
      'asyncStringListKey',
      <String>['Hello Async World 1', 'Hello Async World 2'],
    ),
  ].wait;
}

Future<void> main() async {
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
    final SharedPreferences? prefs =
        useFuture(SharedPreferences.getInstance()).data;
    final SharedPreferencesAsync asyncPrefs =
        useMemoized(() => SharedPreferencesAsync());
    final ValueNotifier<bool> loadingState = useState(false);
    final asyncStringKey = useFuture(asyncPrefs.getString('asyncStringKey')).data;
    final asyncIntKey = useFuture(asyncPrefs.getInt('asyncIntKey')).data;
    final asyncDoubleKey = useFuture(asyncPrefs.getDouble('asyncDoubleKey')).data;
    final asyncBoolKey = useFuture(asyncPrefs.getBool('asyncBoolKey')).data;
    final asyncStringListKey = useFuture(asyncPrefs.getStringList('asyncStringListKey')).data;

    if (prefs == null || loadingState.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('someStringKey: ${prefs.getString('someStringKey')}'),
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
              const SizedBox(height: 8),
              Text('asyncStringKey: $asyncStringKey'),
              const SizedBox(height: 8),
              Text('asyncIntKey: $asyncIntKey'),
              const SizedBox(height: 8),
              Text('asyncDoubleKey: $asyncDoubleKey'),
              const SizedBox(height: 8),
              Text('asyncBoolKey: $asyncBoolKey'),
              const SizedBox(height: 8),
              Text('asyncStringListKey: $asyncStringListKey'),
            ],
          ),
        ],
      ),
    );
  }
}
