import 'package:devtools_app_shared/service.dart';
import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'hot_restart_event_provider.dart';

part 'shared_preferences_tools_eval_provider.g.dart';

@riverpod
EvalOnDartLibrary sharedPreferencesToolsEval(
  SharedPreferencesToolsEvalRef ref,
) {
  // recompute the eval on hot restart
  ref.watch(hotRestartEventProvider);

  final eval = EvalOnDartLibrary(
    'package:shared_preferences_tools/src/shared_preferences_tools_debug.dart',
    serviceManager.service!,
    serviceManager: serviceManager,
  );

  ref.onDispose(eval.dispose);

  return eval;
}
