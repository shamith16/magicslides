import 'package:freezed_annotation/freezed_annotation.dart';
import 'watermark.dart';

part 'presentation_request.freezed.dart';
part 'presentation_request.g.dart';

@freezed
abstract class PresentationRequest with _$PresentationRequest {
  const factory PresentationRequest({
    required String topic,
    required String email,
    required String accessId,
    required String template,
    @Default(10) int slideCount,
    @Default('en') String language,
    @Default(true) bool aiImages,
    @Default(true) bool imageForEachSlide,
    @Default(false) bool googleImage,
    @Default(false) bool googleText,
    @Default('gpt-4') String model,
    @Default('student') String presentationFor,
    @JsonKey(includeIfNull: false) Watermark? watermark,
  }) = _PresentationRequest;

  factory PresentationRequest.fromJson(Map<String, dynamic> json) =>
      _$PresentationRequestFromJson(json);
}
