// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_has_profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveHasProfileHash() =>
    r'd27ad9d96ff4618a69ad3f77a7fa3261ed24022c';

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

/// See also [retrieveHasProfile].
@ProviderFor(retrieveHasProfile)
const retrieveHasProfileProvider = RetrieveHasProfileFamily();

/// See also [retrieveHasProfile].
class RetrieveHasProfileFamily extends Family<AsyncValue<bool>> {
  /// See also [retrieveHasProfile].
  const RetrieveHasProfileFamily();

  /// See also [retrieveHasProfile].
  RetrieveHasProfileProvider call(
    String uid,
  ) {
    return RetrieveHasProfileProvider(
      uid,
    );
  }

  @override
  RetrieveHasProfileProvider getProviderOverride(
    covariant RetrieveHasProfileProvider provider,
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
  String? get name => r'retrieveHasProfileProvider';
}

/// See also [retrieveHasProfile].
class RetrieveHasProfileProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [retrieveHasProfile].
  RetrieveHasProfileProvider(
    String uid,
  ) : this._internal(
          (ref) => retrieveHasProfile(
            ref as RetrieveHasProfileRef,
            uid,
          ),
          from: retrieveHasProfileProvider,
          name: r'retrieveHasProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveHasProfileHash,
          dependencies: RetrieveHasProfileFamily._dependencies,
          allTransitiveDependencies:
              RetrieveHasProfileFamily._allTransitiveDependencies,
          uid: uid,
        );

  RetrieveHasProfileProvider._internal(
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
    FutureOr<bool> Function(RetrieveHasProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveHasProfileProvider._internal(
        (ref) => create(ref as RetrieveHasProfileRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _RetrieveHasProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveHasProfileProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RetrieveHasProfileRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _RetrieveHasProfileProviderElement
    extends AutoDisposeFutureProviderElement<bool> with RetrieveHasProfileRef {
  _RetrieveHasProfileProviderElement(super.provider);

  @override
  String get uid => (origin as RetrieveHasProfileProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
