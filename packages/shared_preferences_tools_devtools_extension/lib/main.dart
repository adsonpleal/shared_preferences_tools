import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/presentation/shared_preferences_tools_body.dart';

void main() {
  runApp(const SharedPreferencesTools());
}

class SharedPreferencesTools extends StatelessWidget {
  const SharedPreferencesTools({super.key});

  @override
  Widget build(BuildContext context) {
    return const DevToolsExtension(
      child: ProviderScope(
        child: SharedPreferencesToolsBody(),
      ),
    );
  }
}
