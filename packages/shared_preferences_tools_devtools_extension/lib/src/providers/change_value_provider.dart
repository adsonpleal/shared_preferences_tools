import 'package:devtools_app_shared/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences_tools/shared_preferences_tools.dart';

import 'shared_preferences_tools_eval_provider.dart';

part 'change_value_provider.g.dart';

typedef ChangeValueFunction = Future<void> Function({
  required String key,
  String value,
  required SharedPreferencesDataType type,
});

@riverpod
ChangeValueFunction changeValue(ChangeValueRef ref) {
  final eval = ref.watch(sharedPreferencesToolsEvalProvider);
  final isAlive = Disposable();
  ref.onDispose(isAlive.dispose);

  return ({
    required String key,
    String value = '',
    required SharedPreferencesDataType type,
  }) async {
    final escapedValue = value.replaceAll('"', '\\"').replaceAll('\\n', '\\\\n');

    final response = await eval.evalInstance(
      'SharedPreferencesToolsDebug.changeValue(key: "$key",value: "$escapedValue",type: ${type.toString()})',
      isAlive: isAlive,
    );
    final responseValue = response.valueAsString;

    if (responseValue != null && responseValue.contains('Error')) {
      throw Exception(responseValue);
    }
  };
}
