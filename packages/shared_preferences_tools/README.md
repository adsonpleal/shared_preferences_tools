A [DevTools extension](https://pub.dev/packages/devtools_extensions) for Flutter's [shared_preferences](https://pub.dev/packages/shared_preferences) package.

## Features

This package adds a new tool to Flutter's DevTools, utilizing the new `devtools_extensions` framework. With this tool, you can:

- List all keys stored in your app's `SharedPreferences`.
- Search for specific keys.
- Edit or remove values directly, with changes reflected in your app instantly.

It supports all data types available in `SharedPreferences`:

- `String`
- `int`
- `double`
- `bool`
- `List<String>`

| Selecting a key | Editing a value |
|-----------------|-----------------|
| <img src='https://raw.githubusercontent.com/adsonpleal/shared_preferences_tools/main/resources/tool_screenshot_1.png'/> | <img src='https://raw.githubusercontent.com/adsonpleal/shared_preferences_tools/main/resources/tool_screenshot_2.png'/> |

## Getting started

To add this package to your project, run:

```shell
flutter pub add shared_preferences_tools
```

That’s it! Now you just need to open your DevTools and use the SharedPreferences tool!

## Contributing to this package

1. Run the example project (or any project that depends on shared_preferences_tools) and copy its debug service URL.
2. Run the `shared_preferences_tools_devtools_extension` project via [VSCode](https://github.com/adsonpleal/shared_preferences_tools/blob/main/.vscode/launch.json) or by running the following command:

```shell
flutter run -d chrome --dart-define=use_simulated_environment=true
```

For more information, see the [devtools_extensions](https://pub.dev/packages/devtools_extensions) package documentation.
