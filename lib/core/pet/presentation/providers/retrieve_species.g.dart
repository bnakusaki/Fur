// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_species.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveSpeciesHash() => r'2a8d869ceb18f7eefa416c0291dbe6677f0a5346';

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

/// See also [retrieveSpecies].
@ProviderFor(retrieveSpecies)
const retrieveSpeciesProvider = RetrieveSpeciesFamily();

/// See also [retrieveSpecies].
class RetrieveSpeciesFamily extends Family<AsyncValue<Species>> {
  /// See also [retrieveSpecies].
  const RetrieveSpeciesFamily();

  /// See also [retrieveSpecies].
  RetrieveSpeciesProvider call(
    String languageCode,
    String speciesId,
  ) {
    return RetrieveSpeciesProvider(
      languageCode,
      speciesId,
    );
  }

  @override
  RetrieveSpeciesProvider getProviderOverride(
    covariant RetrieveSpeciesProvider provider,
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
  String? get name => r'retrieveSpeciesProvider';
}

/// See also [retrieveSpecies].
class RetrieveSpeciesProvider extends AutoDisposeFutureProvider<Species> {
  /// See also [retrieveSpecies].
  RetrieveSpeciesProvider(
    String languageCode,
    String speciesId,
  ) : this._internal(
          (ref) => retrieveSpecies(
            ref as RetrieveSpeciesRef,
            languageCode,
            speciesId,
          ),
          from: retrieveSpeciesProvider,
          name: r'retrieveSpeciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveSpeciesHash,
          dependencies: RetrieveSpeciesFamily._dependencies,
          allTransitiveDependencies:
              RetrieveSpeciesFamily._allTransitiveDependencies,
          languageCode: languageCode,
          speciesId: speciesId,
        );

  RetrieveSpeciesProvider._internal(
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
    FutureOr<Species> Function(RetrieveSpeciesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveSpeciesProvider._internal(
        (ref) => create(ref as RetrieveSpeciesRef),
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
  AutoDisposeFutureProviderElement<Species> createElement() {
    return _RetrieveSpeciesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveSpeciesProvider &&
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

mixin RetrieveSpeciesRef on AutoDisposeFutureProviderRef<Species> {
  /// The parameter `languageCode` of this provider.
  String get languageCode;

  /// The parameter `speciesId` of this provider.
  String get speciesId;
}

class _RetrieveSpeciesProviderElement
    extends AutoDisposeFutureProviderElement<Species> with RetrieveSpeciesRef {
  _RetrieveSpeciesProviderElement(super.provider);

  @override
  String get languageCode => (origin as RetrieveSpeciesProvider).languageCode;
  @override
  String get speciesId => (origin as RetrieveSpeciesProvider).speciesId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
