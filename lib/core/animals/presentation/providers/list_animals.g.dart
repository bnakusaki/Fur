// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_animals.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listAnimalsHash() => r'1572d01e23eccda4ad8d061f7c6cc6a292f19891';

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

/// See also [listAnimals].
@ProviderFor(listAnimals)
const listAnimalsProvider = ListAnimalsFamily();

/// See also [listAnimals].
class ListAnimalsFamily extends Family<AsyncValue<List<Animal>>> {
  /// See also [listAnimals].
  const ListAnimalsFamily();

  /// See also [listAnimals].
  ListAnimalsProvider call(
    String languageCode,
  ) {
    return ListAnimalsProvider(
      languageCode,
    );
  }

  @override
  ListAnimalsProvider getProviderOverride(
    covariant ListAnimalsProvider provider,
  ) {
    return call(
      provider.languageCode,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listAnimalsProvider';
}

/// See also [listAnimals].
class ListAnimalsProvider extends AutoDisposeFutureProvider<List<Animal>> {
  /// See also [listAnimals].
  ListAnimalsProvider(
    String languageCode,
  ) : this._internal(
          (ref) => listAnimals(
            ref as ListAnimalsRef,
            languageCode,
          ),
          from: listAnimalsProvider,
          name: r'listAnimalsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listAnimalsHash,
          dependencies: ListAnimalsFamily._dependencies,
          allTransitiveDependencies:
              ListAnimalsFamily._allTransitiveDependencies,
          languageCode: languageCode,
        );

  ListAnimalsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.languageCode,
  }) : super.internal();

  final String languageCode;

  @override
  Override overrideWith(
    FutureOr<List<Animal>> Function(ListAnimalsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListAnimalsProvider._internal(
        (ref) => create(ref as ListAnimalsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        languageCode: languageCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Animal>> createElement() {
    return _ListAnimalsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListAnimalsProvider && other.languageCode == languageCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListAnimalsRef on AutoDisposeFutureProviderRef<List<Animal>> {
  /// The parameter `languageCode` of this provider.
  String get languageCode;
}

class _ListAnimalsProviderElement
    extends AutoDisposeFutureProviderElement<List<Animal>> with ListAnimalsRef {
  _ListAnimalsProviderElement(super.provider);

  @override
  String get languageCode => (origin as ListAnimalsProvider).languageCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
