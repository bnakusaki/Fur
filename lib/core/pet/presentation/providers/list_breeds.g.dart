// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_breeds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listBreedsHash() => r'a6680561d682221b924b955ff2690ea2240aac22';

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

/// See also [listBreeds].
@ProviderFor(listBreeds)
const listBreedsProvider = ListBreedsFamily();

/// See also [listBreeds].
class ListBreedsFamily extends Family<AsyncValue<List<PetBreed>>> {
  /// See also [listBreeds].
  const ListBreedsFamily();

  /// See also [listBreeds].
  ListBreedsProvider call(
    String languageCode,
  ) {
    return ListBreedsProvider(
      languageCode,
    );
  }

  @override
  ListBreedsProvider getProviderOverride(
    covariant ListBreedsProvider provider,
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
  String? get name => r'listBreedsProvider';
}

/// See also [listBreeds].
class ListBreedsProvider extends AutoDisposeFutureProvider<List<PetBreed>> {
  /// See also [listBreeds].
  ListBreedsProvider(
    String languageCode,
  ) : this._internal(
          (ref) => listBreeds(
            ref as ListBreedsRef,
            languageCode,
          ),
          from: listBreedsProvider,
          name: r'listBreedsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listBreedsHash,
          dependencies: ListBreedsFamily._dependencies,
          allTransitiveDependencies:
              ListBreedsFamily._allTransitiveDependencies,
          languageCode: languageCode,
        );

  ListBreedsProvider._internal(
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
    FutureOr<List<PetBreed>> Function(ListBreedsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListBreedsProvider._internal(
        (ref) => create(ref as ListBreedsRef),
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
  AutoDisposeFutureProviderElement<List<PetBreed>> createElement() {
    return _ListBreedsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListBreedsProvider && other.languageCode == languageCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListBreedsRef on AutoDisposeFutureProviderRef<List<PetBreed>> {
  /// The parameter `languageCode` of this provider.
  String get languageCode;
}

class _ListBreedsProviderElement
    extends AutoDisposeFutureProviderElement<List<PetBreed>>
    with ListBreedsRef {
  _ListBreedsProviderElement(super.provider);

  @override
  String get languageCode => (origin as ListBreedsProvider).languageCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
