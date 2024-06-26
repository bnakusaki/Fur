// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_breed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveBreedHash() => r'533d76785d7fef68b1ca925c69f5e448e54fb1d3';

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

/// See also [retrieveBreed].
@ProviderFor(retrieveBreed)
const retrieveBreedProvider = RetrieveBreedFamily();

/// See also [retrieveBreed].
class RetrieveBreedFamily extends Family<AsyncValue<Breed>> {
  /// See also [retrieveBreed].
  const RetrieveBreedFamily();

  /// See also [retrieveBreed].
  RetrieveBreedProvider call(
    String languageCode,
    String animalId,
    String breedId,
  ) {
    return RetrieveBreedProvider(
      languageCode,
      animalId,
      breedId,
    );
  }

  @override
  RetrieveBreedProvider getProviderOverride(
    covariant RetrieveBreedProvider provider,
  ) {
    return call(
      provider.languageCode,
      provider.animalId,
      provider.breedId,
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
  String? get name => r'retrieveBreedProvider';
}

/// See also [retrieveBreed].
class RetrieveBreedProvider extends AutoDisposeFutureProvider<Breed> {
  /// See also [retrieveBreed].
  RetrieveBreedProvider(
    String languageCode,
    String animalId,
    String breedId,
  ) : this._internal(
          (ref) => retrieveBreed(
            ref as RetrieveBreedRef,
            languageCode,
            animalId,
            breedId,
          ),
          from: retrieveBreedProvider,
          name: r'retrieveBreedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveBreedHash,
          dependencies: RetrieveBreedFamily._dependencies,
          allTransitiveDependencies:
              RetrieveBreedFamily._allTransitiveDependencies,
          languageCode: languageCode,
          animalId: animalId,
          breedId: breedId,
        );

  RetrieveBreedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.languageCode,
    required this.animalId,
    required this.breedId,
  }) : super.internal();

  final String languageCode;
  final String animalId;
  final String breedId;

  @override
  Override overrideWith(
    FutureOr<Breed> Function(RetrieveBreedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveBreedProvider._internal(
        (ref) => create(ref as RetrieveBreedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        languageCode: languageCode,
        animalId: animalId,
        breedId: breedId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Breed> createElement() {
    return _RetrieveBreedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveBreedProvider &&
        other.languageCode == languageCode &&
        other.animalId == animalId &&
        other.breedId == breedId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageCode.hashCode);
    hash = _SystemHash.combine(hash, animalId.hashCode);
    hash = _SystemHash.combine(hash, breedId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RetrieveBreedRef on AutoDisposeFutureProviderRef<Breed> {
  /// The parameter `languageCode` of this provider.
  String get languageCode;

  /// The parameter `animalId` of this provider.
  String get animalId;

  /// The parameter `breedId` of this provider.
  String get breedId;
}

class _RetrieveBreedProviderElement
    extends AutoDisposeFutureProviderElement<Breed> with RetrieveBreedRef {
  _RetrieveBreedProviderElement(super.provider);

  @override
  String get languageCode => (origin as RetrieveBreedProvider).languageCode;
  @override
  String get animalId => (origin as RetrieveBreedProvider).animalId;
  @override
  String get breedId => (origin as RetrieveBreedProvider).breedId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
