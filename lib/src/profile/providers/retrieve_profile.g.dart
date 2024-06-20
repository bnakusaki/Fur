// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveProfileHash() => r'73ec2552a6a9d6d15d9bc3b6ce77d146cce79cd0';

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

/// See also [retrieveProfile].
@ProviderFor(retrieveProfile)
const retrieveProfileProvider = RetrieveProfileFamily();

/// See also [retrieveProfile].
class RetrieveProfileFamily extends Family<AsyncValue<User>> {
  /// See also [retrieveProfile].
  const RetrieveProfileFamily();

  /// See also [retrieveProfile].
  RetrieveProfileProvider call(
    String uid,
  ) {
    return RetrieveProfileProvider(
      uid,
    );
  }

  @override
  RetrieveProfileProvider getProviderOverride(
    covariant RetrieveProfileProvider provider,
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
  String? get name => r'retrieveProfileProvider';
}

/// See also [retrieveProfile].
class RetrieveProfileProvider extends AutoDisposeFutureProvider<User> {
  /// See also [retrieveProfile].
  RetrieveProfileProvider(
    String uid,
  ) : this._internal(
          (ref) => retrieveProfile(
            ref as RetrieveProfileRef,
            uid,
          ),
          from: retrieveProfileProvider,
          name: r'retrieveProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveProfileHash,
          dependencies: RetrieveProfileFamily._dependencies,
          allTransitiveDependencies:
              RetrieveProfileFamily._allTransitiveDependencies,
          uid: uid,
        );

  RetrieveProfileProvider._internal(
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
    FutureOr<User> Function(RetrieveProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveProfileProvider._internal(
        (ref) => create(ref as RetrieveProfileRef),
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
  AutoDisposeFutureProviderElement<User> createElement() {
    return _RetrieveProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveProfileProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RetrieveProfileRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _RetrieveProfileProviderElement
    extends AutoDisposeFutureProviderElement<User> with RetrieveProfileRef {
  _RetrieveProfileProviderElement(super.provider);

  @override
  String get uid => (origin as RetrieveProfileProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
