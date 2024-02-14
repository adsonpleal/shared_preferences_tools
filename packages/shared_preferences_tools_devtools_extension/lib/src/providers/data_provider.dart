import 'package:devtools_app_shared/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: implementation_imports
import 'package:shared_preferences_tools/src/models/shared_preferences_data.dart';
import 'package:vm_service/vm_service.dart';

import 'shared_preferences_tools_eval_provider.dart';

part 'data_provider.g.dart';

@riverpod
Future<SharedPreferencesData> sharedPreferencesData(
  SharedPreferencesDataRef ref,
  String key,
) async {
  final eval = ref.watch(sharedPreferencesToolsEvalProvider);
  final isAlive = Disposable();
  ref.onDispose(isAlive.dispose);

  final dataInstance = await eval.evalInstance(
    "SharedPreferencesToolsDebug.getData('$key')",
    isAlive: isAlive,
  );

  Future<String> dataFieldInstance(String name) async {
    final instance = await eval.safeGetInstance(
      dataInstance.associations!
          .firstWhere(
            (a) => (a.key as InstanceRef).valueAsString == name,
          )
          .value as InstanceRef,
      isAlive,
    );

    return instance.valueAsString!;
  }

  final [
    type,
    value,
  ] = await Future.wait([
    dataFieldInstance('type'),
    dataFieldInstance('value'),
  ]);

  return SharedPreferencesData.fromValueAndType(value, type);
}
