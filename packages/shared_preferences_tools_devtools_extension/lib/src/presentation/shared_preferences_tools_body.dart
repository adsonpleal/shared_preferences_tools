import 'package:devtools_app_shared/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: implementation_imports
import 'package:shared_preferences_tools/src/models/shared_preferences_data.dart';

import '../providers/change_value_provider.dart';
import '../providers/data_provider.dart';
import '../providers/keys_provider.dart';

part 'shared_preferences_tools_body.g.dart';

class DataPanelState {
  DataPanelState(
    this.data,
    this.selectedKey,
  );

  final SharedPreferencesData data;
  final String selectedKey;
}

@riverpod
Future<DataPanelState?> dataPanelState(DataPanelStateRef ref) async {
  final selectedKey = ref.watch(selectedKeyNotifierProvider);

  if (selectedKey == null) {
    return null;
  }

  final data = await ref.watch(
    sharedPreferencesDataProvider(selectedKey).future,
  );

  return DataPanelState(
    data,
    selectedKey,
  );
}

@riverpod
class SelectedKeyNotifier extends _$SelectedKeyNotifier {
  @override
  String? build() => null;

  void select(String keyName) {
    state = keyName;
  }
}

class SharedPreferencesToolsBody extends StatelessWidget {
  const SharedPreferencesToolsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final splitAxis = Split.axisFor(context, 0.85);

    return Split(
      axis: splitAxis,
      initialFractions: const [0.33, 0.67],
      children: const [
        _KeysPanel(),
        _DataPanel(),
      ],
    );
  }
}

class _DataPanel extends HookConsumerWidget {
  const _DataPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeValue = ref.watch(changeValueProvider);
    final asyncState = ref.watch(dataPanelStateProvider);
    final editingState = useState(false);
    final valueHolder = useState<String?>(null);
    final showSnackBar = useCallback((String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    });
    final dismissDialog = useCallback(() {
      Navigator.of(context).pop();
    });

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          editingState.value = false;
          valueHolder.value = null;
        });

        return null;
      },
      [asyncState],
    );

    return RoundedOutlinedBorder(
      clip: true,
      child: asyncState.when(
        data: (state) {
          if (state == null) {
            return const Center(
              child: Text('Select a key to view its data.'),
            );
          }

          return Column(
            children: [
              AreaPaneHeader(
                roundedTopBorder: false,
                includeTopBorder: false,
                tall: true,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        state.selectedKey,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    if (editingState.value) ...[
                      TextButton(
                        onPressed: () {
                          editingState.value = false;
                        },
                        child: const Text('Cancel'),
                      ),
                      if (valueHolder.value != null &&
                          valueHolder.value != state.data.value) ...[
                        const SizedBox(width: defaultSpacing),
                        TextButton(
                          onPressed: () async {
                            try {
                              await changeValue(
                                key: state.selectedKey,
                                value: valueHolder.value!,
                                type: state.data.type,
                              );
                            } catch (error) {
                              showSnackBar('Error: $error');
                            }

                            ref.invalidate(
                              sharedPreferencesDataProvider(state.selectedKey),
                            );
                          },
                          child: const Text('Commit changes'),
                        ),
                      ],
                    ] else ...[
                      TextButton(
                        onPressed: () => showDialog<void>(
                          context: context,
                          builder: (context) {
                            return DevToolsDialog(
                              title: const Text('Remove Key'),
                              content: Text(
                                'Are you sure you want to remove ${state.selectedKey}?',
                              ),
                              actions: [
                                const DialogCloseButton(),
                                DialogTextButton(
                                  child: const Text('REMOVE'),
                                  onPressed: () async {
                                    try {
                                      await changeValue(
                                        key: state.selectedKey,
                                        type: SharedPreferencesDataType.noValue,
                                      );
                                    } catch (error) {
                                      showSnackBar('Error: $error');
                                    }

                                    editingState.value = false;
                                    ref.invalidate(selectedKeyNotifierProvider);
                                    ref.invalidate(keysProvider);
                                    dismissDialog();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        child: const Text('Remove'),
                      ),
                      TextButton(
                        onPressed: () {
                          editingState.value = true;
                        },
                        child: const Text('Edit'),
                      ),
                    ],
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(largeSpacing),
                  child: SelectionArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Type: ${state.data.type.prettyName}'),
                        const SizedBox(height: denseSpacing),
                        if (editingState.value) ...[
                          const Text('Value:'),
                          const SizedBox(height: denseSpacing),
                          switch (state.data.type) {
                            SharedPreferencesDataType.bool => DropdownMenu(
                                initialSelection: bool.parse(state.data.value),
                                onSelected: (value) {
                                  valueHolder.value = value.toString();
                                },
                                dropdownMenuEntries: const [
                                  DropdownMenuEntry(
                                    label: 'true',
                                    value: true,
                                  ),
                                  DropdownMenuEntry(
                                    label: 'false',
                                    value: false,
                                  ),
                                ],
                              ),
                            _ => TextFormField(
                                autofocus: true,
                                initialValue: state.data.value,
                                inputFormatters: switch (state.data.type) {
                                  SharedPreferencesDataType.int => [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^-?\d*'),
                                      ),
                                    ],
                                  SharedPreferencesDataType.double => [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^-?\d*\.?\d*'),
                                      ),
                                    ],
                                  _ => [],
                                },
                                onChanged: (value) => valueHolder.value = value,
                              )
                          },
                        ] else ...[
                          Text('Value: ${state.data.prettyValue}'),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: _ErrorPanel.new,
      ),
    );
  }
}

class _ErrorPanel extends StatelessWidget {
  const _ErrorPanel(
    this.error,
    this.stackTrace,
  );

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(densePadding),
      child: Text('Error:\n$error\n\n$stackTrace'),
    );
  }
}

@riverpod
class _KeysNotifier extends _$KeysNotifier {
  late List<String> _keys;

  @override
  Future<List<String>> build() async {
    return _keys = await ref.watch(keysProvider.future);
  }

  // poor man's fuzzy search algorithm
  void filter(String token) {
    final lowercaseToken = token.toLowerCase();
    state = AsyncValue.data(
      _keys.where((key) {
        var currentSubstring = key.toLowerCase();
        for (final char in lowercaseToken.characters) {
          final currentIndex = currentSubstring.indexOf(char);
          if (currentIndex == -1) {
            return false;
          }
          currentSubstring = currentSubstring.substring(currentIndex + 1);
        }
        return true;
      }).toList(),
    );
  }
}

class _KeysPanel extends HookConsumerWidget {
  const _KeysPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keysData = ref.watch(_keysNotifierProvider);
    final searchingState = useState(false);
    final searchFocusNode = useFocusNode();
    final stopSearching = useCallback(() {
      searchingState.value = false;
      ref.read(_keysNotifierProvider.notifier).filter('');
    });
    ref.listen(
      keysProvider,
      (_, __) => stopSearching(),
    );

    return RoundedOutlinedBorder(
      clip: true,
      child: Column(
        children: [
          AreaPaneHeader(
            roundedTopBorder: false,
            includeTopBorder: false,
            tall: true,
            title: Row(
              children: [
                Text(
                  'Stored Keys',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                if (searchingState.value) ...[
                  const SizedBox(
                    width: denseSpacing,
                  ),
                  Expanded(
                    child: KeyboardListener(
                      focusNode: searchFocusNode,
                      onKeyEvent: (value) {
                        if (value.logicalKey == LogicalKeyboardKey.escape) {
                          stopSearching();
                        }
                      },
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: densePadding,
                          ),
                          hintText: 'Search',
                          border: const OutlineInputBorder(),
                          suffix: Tooltip(
                            message: 'Stop searching',
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                size: 16,
                              ),
                              onPressed: stopSearching,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          ref
                              .read(_keysNotifierProvider.notifier)
                              .filter(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: denseSpacing,
                  ),
                ] else ...[
                  const Spacer(),
                  Tooltip(
                    message: 'Search',
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 16,
                      ),
                      onPressed: () {
                        searchingState.value = true;
                      },
                    ),
                  ),
                ],
                Tooltip(
                  message: 'Refresh',
                  child: IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      size: 16,
                    ),
                    onPressed: () {
                      ref.invalidate(keysProvider);
                      ref.invalidate(selectedKeyNotifierProvider);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: keysData.when(
              skipLoadingOnRefresh: false,
              data: (keys) => _KeysList(keys: keys),
              error: _ErrorPanel.new,
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeysList extends HookConsumerWidget {
  const _KeysList({
    required this.keys,
  });

  final List<String> keys;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        itemCount: keys.length,
        itemBuilder: (context, index) => _KeyItem(
          keyName: keys[index],
        ),
      ),
    );
  }
}

class _KeyItem extends HookConsumerWidget {
  const _KeyItem({
    required this.keyName,
  });

  final String keyName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      selectedKeyNotifierProvider.select(
        (selectedKey) => selectedKey == keyName,
      ),
    );
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor =
        isSelected ? colorScheme.selectedRowBackgroundColor : null;

    return InkWell(
      onTap: () {
        ref.read(selectedKeyNotifierProvider.notifier).select(keyName);
      },
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.only(
          left: defaultSpacing,
          right: densePadding,
          top: densePadding,
          bottom: densePadding,
        ),
        child: Text(
          keyName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
