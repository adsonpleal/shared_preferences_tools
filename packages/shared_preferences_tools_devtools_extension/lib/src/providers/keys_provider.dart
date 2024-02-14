import 'package:devtools_app_shared/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vm_service/vm_service.dart';

import 'shared_preferences_tools_eval_provider.dart';

part 'keys_provider.g.dart';

@riverpod
Future<List<String>> keys(KeysRef ref) async {
  final eval = ref.watch(sharedPreferencesToolsEvalProvider);
  final isAlive = Disposable();
  ref.onDispose(isAlive.dispose);

  final keys = await eval.evalInstance(
    'SharedPreferencesToolsDebug.keys',
    isAlive: isAlive,
  );
  final keysInstances = await Future.wait([
    for (final keyRef in keys.elements!.cast<InstanceRef>()) eval.safeGetInstance(keyRef, isAlive),
  ]);

  return keysInstances.map((keyInstance) => keyInstance.valueAsString!).toList()
    ..sort(
      (a, b) => a.compareTo(b),
    );
}
