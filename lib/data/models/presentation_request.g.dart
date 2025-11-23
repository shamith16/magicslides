// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresentationRequest _$PresentationRequestFromJson(Map<String, dynamic> json) =>
    _PresentationRequest(
      topic: json['topic'] as String,
      email: json['email'] as String,
      accessId: json['accessId'] as String,
      template: json['template'] as String,
      slideCount: (json['slideCount'] as num?)?.toInt() ?? 10,
      language: json['language'] as String? ?? 'en',
      aiImages: json['aiImages'] as bool? ?? true,
      imageForEachSlide: json['imageForEachSlide'] as bool? ?? true,
      googleImage: json['googleImage'] as bool? ?? false,
      googleText: json['googleText'] as bool? ?? false,
      model: json['model'] as String? ?? 'gpt-4',
      presentationFor: json['presentationFor'] as String? ?? 'student',
      watermark: json['watermark'] == null
          ? null
          : Watermark.fromJson(json['watermark'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PresentationRequestToJson(
  _PresentationRequest instance,
) => <String, dynamic>{
  'topic': instance.topic,
  'email': instance.email,
  'accessId': instance.accessId,
  'template': instance.template,
  'slideCount': instance.slideCount,
  'language': instance.language,
  'aiImages': instance.aiImages,
  'imageForEachSlide': instance.imageForEachSlide,
  'googleImage': instance.googleImage,
  'googleText': instance.googleText,
  'model': instance.model,
  'presentationFor': instance.presentationFor,
  'watermark': ?instance.watermark,
};
