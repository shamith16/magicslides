// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageService)
const storageServiceProvider = StorageServiceProvider._();

final class StorageServiceProvider
    extends $FunctionalProvider<StorageService, StorageService, StorageService>
    with $Provider<StorageService> {
  const StorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageServiceHash();

  @$internal
  @override
  $ProviderElement<StorageService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StorageService create(Ref ref) {
    return storageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageService>(value),
    );
  }
}

String _$storageServiceHash() => r'a6d470f06069cf6a775ff59954151676a232f772';

@ProviderFor(mongoDatabase)
const mongoDatabaseProvider = MongoDatabaseProvider._();

final class MongoDatabaseProvider
    extends $FunctionalProvider<MongoDatabase, MongoDatabase, MongoDatabase>
    with $Provider<MongoDatabase> {
  const MongoDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mongoDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mongoDatabaseHash();

  @$internal
  @override
  $ProviderElement<MongoDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MongoDatabase create(Ref ref) {
    return mongoDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MongoDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MongoDatabase>(value),
    );
  }
}

String _$mongoDatabaseHash() => r'6b5215295d57eb43f66f21235d98d3260bda8ef0';

@ProviderFor(AuthNotifier)
const authProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $AsyncNotifierProvider<AuthNotifier, void> {
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'9d79420085384971d942e1991dc278606e627f60';

abstract class _$AuthNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
