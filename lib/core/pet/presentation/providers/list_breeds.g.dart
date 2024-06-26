// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_breeds.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listBreedsHash() => r'0e497c83a6511235100e5fa0074cf248b19f006f';

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
class ListBreedsFamily extends Family<AsyncValue<List<Breed>>> {
  /// See also [listBreeds].
  const ListBreedsFamily();

  /// See also [listBreeds].
  ListBreedsProvider call(
    String languageCode,
    String speciesId,
  ) {
    return ListBreedsProvider(
      languageCode,
      speciesId,
    );
  }

  @override
  ListBreedsProvider getProviderOverride(
    covariant ListBreedsProvider provider,
  ) {
    return call(
      provider.languageCode,
      provider.speciesId,
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
class ListBreedsProvider extends AutoDisposeFutureProvider<List<Breed>> {
  /// See also [listBreeds].
  ListBreedsProvider(
    String languageCode,
    String speciesId,
  ) : this._internal(
          (ref) => listBreeds(
            ref as ListBreedsRef,
            languageCode,
            speciesId,
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
          speciesId: speciesId,
        );

  ListBreedsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.languageCode,
    required this.speciesId,
  }) : super.internal();

  final String languageCode;
  final String speciesId;

  @override
  Override overrideWith(
    FutureOr<List<Breed>> Function(ListBreedsRef provider) create,
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
        speciesId: speciesId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Breed>> createElement() {
    return _ListBreedsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListBreedsProvider &&
        other.languageCode == languageCode &&
        other.speciesId == speciesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageCode.hashCode);
    hash = _SystemHash.combine(hash, speciesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListBreedsRef on AutoDisposeFutureProviderRef<List<Breed>> {
  /// The parameter `languageCode` of this provider.
  String get languageCode;

  /// The parameter `speciesId` of this provider.
  String get speciesId;
}

class _ListBreedsProviderElement
    extends AutoDisposeFutureProviderElement<List<Breed>> with ListBreedsRef {
  _ListBreedsProviderElement(super.provider);

  @override
  String get languageCode => (origin as ListBreedsProvider).languageCode;
  @override
  String get speciesId => (origin as ListBreedsProvider).speciesId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
