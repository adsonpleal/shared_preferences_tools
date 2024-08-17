import 'package:devtools_extensions/devtools_extensions.dart';
import 'package:flutter/material.dart';

import 'src/shared_preferences_state_provider.dart';
import 'src/ui/shared_preferences_body.dart';

void main() {
  runApp(const _SharedPreferencesTool());
}

class _SharedPreferencesTool extends StatelessWidget {
  const _SharedPreferencesTool();

  @override
  Widget build(BuildContext context) {
    return const DevToolsExtension(
      child: SharedPreferencesStateProvider(
        child: SharedPreferencesBody(),
      ),
    );
  }
}
