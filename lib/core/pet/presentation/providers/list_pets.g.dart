// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pets.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listPetsHash() => r'677a0d78d37b3054f7c891e8fc181384a75de3d7';

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

/// See also [listPets].
@ProviderFor(listPets)
const listPetsProvider = ListPetsFamily();

/// See also [listPets].
class ListPetsFamily extends Family<AsyncValue<List<Pet>>> {
  /// See also [listPets].
  const ListPetsFamily();

  /// See also [listPets].
  ListPetsProvider call(
    String uid,
  ) {
    return ListPetsProvider(
      uid,
    );
  }

  @override
  ListPetsProvider getProviderOverride(
    covariant ListPetsProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'listPetsProvider';
}

/// See also [listPets].
class ListPetsProvider extends AutoDisposeFutureProvider<List<Pet>> {
  /// See also [listPets].
  ListPetsProvider(
    String uid,
  ) : this._internal(
          (ref) => listPets(
            ref as ListPetsRef,
            uid,
          ),
          from: listPetsProvider,
          name: r'listPetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listPetsHash,
          dependencies: ListPetsFamily._dependencies,
          allTransitiveDependencies: ListPetsFamily._allTransitiveDependencies,
          uid: uid,
        );

  ListPetsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    FutureOr<List<Pet>> Function(ListPetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListPetsProvider._internal(
        (ref) => create(ref as ListPetsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Pet>> createElement() {
    return _ListPetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListPetsProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListPetsRef on AutoDisposeFutureProviderRef<List<Pet>> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _ListPetsProviderElement
    extends AutoDisposeFutureProviderElement<List<Pet>> with ListPetsRef {
  _ListPetsProviderElement(super.provider);

  @override
  String get uid => (origin as ListPetsProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
