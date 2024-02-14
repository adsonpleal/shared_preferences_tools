import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vm_service/vm_service.dart';

// Copied from https://github.com/rrousselGit/provider/blob/229124ab91e802af21574fa084145d73070cf31b/packages/provider_devtools_extension/lib/src/instance_viewer/eval.dart#L58-L73
final hotRestartEventProvider = ChangeNotifierProvider<ValueNotifier<void>>((ref) {
  final selectedIsolateListenable = serviceManager.isolateManager.selectedIsolate;

  // Since ChangeNotifierProvider calls `dispose` on the returned ChangeNotifier
  // when the provider is destroyed, we can't simply return `selectedIsolateListenable`.
  // So we're making a copy of it instead.
  final notifier = ValueNotifier<IsolateRef?>(selectedIsolateListenable.value);

  void listener() => notifier.value = selectedIsolateListenable.value;
  selectedIsolateListenable.addListener(listener);
  ref.onDispose(() => selectedIsolateListenable.removeListener(listener));

  return notifier;
});
