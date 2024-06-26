// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_species.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listSpeciesHash() => r'97e9320fa99e0fb379d36ae4b701f261cde2afcc';

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

/// See also [listSpecies].
@ProviderFor(listSpecies)
const listSpeciesProvider = ListSpeciesFamily();

/// See also [listSpecies].
class ListSpeciesFamily extends Family<AsyncValue<List<Species>>> {
  /// See also [listSpecies].
  const ListSpeciesFamily();

  /// See also [listSpecies].
  ListSpeciesProvider call(
    String languageCode,
  ) {
    return ListSpeciesProvider(
      languageCode,
    );
  }

  @override
  ListSpeciesProvider getProviderOverride(
    covariant ListSpeciesProvider provider,
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
  String? get name => r'listSpeciesProvider';
}

/// See also [listSpecies].
class ListSpeciesProvider extends AutoDisposeFutureProvider<List<Species>> {
  /// See also [listSpecies].
  ListSpeciesProvider(
    String languageCode,
  ) : this._internal(
          (ref) => listSpecies(
            ref as ListSpeciesRef,
            languageCode,
          ),
          from: listSpeciesProvider,
          name: r'listSpeciesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listSpeciesHash,
          dependencies: ListSpeciesFamily._dependencies,
          allTransitiveDependencies:
              ListSpeciesFamily._allTransitiveDependencies,
          languageCode: languageCode,
        );

  ListSpeciesProvider._internal(
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
    FutureOr<List<Species>> Function(ListSpeciesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListSpeciesProvider._internal(
        (ref) => create(ref as ListSpeciesRef),
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
  AutoDisposeFutureProviderElement<List<Species>> createElement() {
    return _ListSpeciesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListSpeciesProvider && other.languageCode == languageCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListSpeciesRef on AutoDisposeFutureProviderRef<List<Species>> {
  /// The parameter `languageCode` of this provider.
  String get languageCode;
}

class _ListSpeciesProviderElement
    extends AutoDisposeFutureProviderElement<List<Species>>
    with ListSpeciesRef {
  _ListSpeciesProviderElement(super.provider);

  @override
  String get languageCode => (origin as ListSpeciesProvider).languageCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
