// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(magicSlidesService)
const magicSlidesServiceProvider = MagicSlidesServiceProvider._();

final class MagicSlidesServiceProvider
    extends
        $FunctionalProvider<
          MagicSlidesService,
          MagicSlidesService,
          MagicSlidesService
        >
    with $Provider<MagicSlidesService> {
  const MagicSlidesServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'magicSlidesServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$magicSlidesServiceHash();

  @$internal
  @override
  $ProviderElement<MagicSlidesService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MagicSlidesService create(Ref ref) {
    return magicSlidesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MagicSlidesService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MagicSlidesService>(value),
    );
  }
}

String _$magicSlidesServiceHash() =>
    r'0926cf88cf82b68035500d163eeca2fb0280a669';

@ProviderFor(PresentationNotifier)
const presentationProvider = PresentationNotifierProvider._();

final class PresentationNotifierProvider
    extends
        $AsyncNotifierProvider<PresentationNotifier, PresentationResponse?> {
  const PresentationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'presentationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$presentationNotifierHash();

  @$internal
  @override
  PresentationNotifier create() => PresentationNotifier();
}

String _$presentationNotifierHash() =>
    r'395288915e490507ca14fc611e7602deec355e5d';

abstract class _$PresentationNotifier
    extends $AsyncNotifier<PresentationResponse?> {
  FutureOr<PresentationResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<PresentationResponse?>, PresentationResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PresentationResponse?>,
                PresentationResponse?
              >,
              AsyncValue<PresentationResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
