// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesDataHash() => r'9da882d52b170f9f26a4e61d62fe0e3957e6cacc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [sharedPreferencesData].
@ProviderFor(sharedPreferencesData)
const sharedPreferencesDataProvider = SharedPreferencesDataFamily();

/// See also [sharedPreferencesData].
class SharedPreferencesDataFamily extends Family<AsyncValue<SharedPreferencesData>> {
  /// See also [sharedPreferencesData].
  const SharedPreferencesDataFamily();

  /// See also [sharedPreferencesData].
  SharedPreferencesDataProvider call(
    String key,
  ) {
    return SharedPreferencesDataProvider(
      key,
    );
  }

  @override
  SharedPreferencesDataProvider getProviderOverride(
    covariant SharedPreferencesDataProvider provider,
  ) {
    return call(
      provider.key,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'sharedPreferencesDataProvider';
}

/// See also [sharedPreferencesData].
class SharedPreferencesDataProvider extends AutoDisposeFutureProvider<SharedPreferencesData> {
  /// See also [sharedPreferencesData].
  SharedPreferencesDataProvider(
    String key,
  ) : this._internal(
          (ref) => sharedPreferencesData(
            ref as SharedPreferencesDataRef,
            key,
          ),
          from: sharedPreferencesDataProvider,
          name: r'sharedPreferencesDataProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$sharedPreferencesDataHash,
          dependencies: SharedPreferencesDataFamily._dependencies,
          allTransitiveDependencies: SharedPreferencesDataFamily._allTransitiveDependencies,
          key: key,
        );

  SharedPreferencesDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  Override overrideWith(
    FutureOr<SharedPreferencesData> Function(SharedPreferencesDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SharedPreferencesDataProvider._internal(
        (ref) => create(ref as SharedPreferencesDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SharedPreferencesData> createElement() {
    return _SharedPreferencesDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SharedPreferencesDataProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SharedPreferencesDataRef on AutoDisposeFutureProviderRef<SharedPreferencesData> {
  /// The parameter `key` of this provider.
  String get key;
}

class _SharedPreferencesDataProviderElement extends AutoDisposeFutureProviderElement<SharedPreferencesData>
    with SharedPreferencesDataRef {
  _SharedPreferencesDataProviderElement(super.provider);

  @override
  String get key => (origin as SharedPreferencesDataProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
