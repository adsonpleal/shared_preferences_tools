pushd packages/shared_preferences_tools

rm -rf extension/devtools/build
mkdir extension/devtools/build

popd

pushd packages/shared_preferences_tools_devtools_extension

flutter pub get &&
dart run devtools_extensions build_and_copy \
  --source=. \
  --dest=../shared_preferences_tools/extension/devtools

popd
