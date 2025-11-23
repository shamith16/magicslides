// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoadingMessageNotifier)
const loadingMessageProvider = LoadingMessageNotifierProvider._();

final class LoadingMessageNotifierProvider
    extends $NotifierProvider<LoadingMessageNotifier, String?> {
  const LoadingMessageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadingMessageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadingMessageNotifierHash();

  @$internal
  @override
  LoadingMessageNotifier create() => LoadingMessageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$loadingMessageNotifierHash() =>
    r'93995b2475732b927e69cfd324de9f7ba64ede2c';

abstract class _$LoadingMessageNotifier extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
