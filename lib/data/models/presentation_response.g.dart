// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresentationResponse _$PresentationResponseFromJson(
  Map<String, dynamic> json,
) => _PresentationResponse(
  success: json['status'] == null ? false : _statusToBool(json['status']),
  message: json['message'] as String?,
  presentationSubtitle: json['presentationSubtitle'] as String?,
  imageSearch: json['imageSearch'] as String?,
  slides: (json['slides'] as List<dynamic>?)
      ?.map((e) => PresentationSlide.fromJson(e as Map<String, dynamic>))
      .toList(),
  pptId: json['pptId'] as String?,
  userMessage: json['UserMessage'] as String?,
  openAICallTime: (json['openAICallTime'] as num?)?.toInt(),
  tokenUsed: (json['tokenUsed'] as num?)?.toInt(),
  pdfUrl: json['pdfUrl'] as String?,
  model: json['model'] as String?,
  customStartGenerationTime: json['customStartGenerationTime'] as String?,
  data: json['data'] == null
      ? null
      : PresentationData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PresentationResponseToJson(
  _PresentationResponse instance,
) => <String, dynamic>{
  'status': instance.success,
  'message': instance.message,
  'presentationSubtitle': instance.presentationSubtitle,
  'imageSearch': instance.imageSearch,
  'slides': instance.slides,
  'pptId': instance.pptId,
  'UserMessage': instance.userMessage,
  'openAICallTime': instance.openAICallTime,
  'tokenUsed': instance.tokenUsed,
  'pdfUrl': instance.pdfUrl,
  'model': instance.model,
  'customStartGenerationTime': instance.customStartGenerationTime,
  'data': instance.data,
};

_PresentationSlide _$PresentationSlideFromJson(Map<String, dynamic> json) =>
    _PresentationSlide(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      imageSearch: json['imageSearch'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map(
            (e) => PresentationSlideContent.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$PresentationSlideToJson(_PresentationSlide instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageSearch': instance.imageSearch,
      'content': instance.content,
    };

_PresentationSlideContent _$PresentationSlideContentFromJson(
  Map<String, dynamic> json,
) => _PresentationSlideContent(
  title: json['title'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$PresentationSlideContentToJson(
  _PresentationSlideContent instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
};

_PresentationData _$PresentationDataFromJson(Map<String, dynamic> json) =>
    _PresentationData(
      message: json['message'] as String?,
      presentationId: json['presentationId'] as String?,
      url: json['url'] as String?,
      pptId: json['pptId'] as String?,
      error: json['error'] as bool?,
    );

Map<String, dynamic> _$PresentationDataToJson(_PresentationData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'presentationId': instance.presentationId,
      'url': instance.url,
      'pptId': instance.pptId,
      'error': instance.error,
    };
