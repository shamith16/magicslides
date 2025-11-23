import 'package:freezed_annotation/freezed_annotation.dart';

part 'presentation_response.freezed.dart';
part 'presentation_response.g.dart';

@freezed
abstract class PresentationResponse with _$PresentationResponse {
  const factory PresentationResponse({
    @JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false)
        required bool success,
    String? message,
    String? presentationSubtitle,
    String? imageSearch,
    List<PresentationSlide>? slides,
    String? pptId,
    @JsonKey(name: 'UserMessage') String? userMessage,
    int? openAICallTime,
    int? tokenUsed,
    String? pdfUrl,
    String? model,
    String? customStartGenerationTime,
    PresentationData? data,
  }) = _PresentationResponse;

  factory PresentationResponse.fromJson(Map<String, dynamic> json) =>
      _$PresentationResponseFromJson(json);
}

bool _statusToBool(dynamic value) {
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'success' || value.toLowerCase() == 'true';
  }
  if (value is num) return value != 0;
  return false;
}

@freezed
abstract class PresentationSlide with _$PresentationSlide {
  const factory PresentationSlide({
    required String title,
    String? subtitle,
    String? imageSearch,
    List<PresentationSlideContent>? content,
  }) = _PresentationSlide;

  factory PresentationSlide.fromJson(Map<String, dynamic> json) =>
      _$PresentationSlideFromJson(json);
}

@freezed
abstract class PresentationSlideContent with _$PresentationSlideContent {
  const factory PresentationSlideContent({
    required String title,
    required String description,
  }) = _PresentationSlideContent;

  factory PresentationSlideContent.fromJson(Map<String, dynamic> json) =>
      _$PresentationSlideContentFromJson(json);
}

@freezed
abstract class PresentationData with _$PresentationData {
  const factory PresentationData({
    String? message,
    String? presentationId,
    String? url,
    String? pptId,
    bool? error,
  }) = _PresentationData;

  factory PresentationData.fromJson(Map<String, dynamic> json) =>
      _$PresentationDataFromJson(json);
}
