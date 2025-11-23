// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresentationRequest {

 String get topic; String get email; String get accessId; String get template; int get slideCount; String get language; bool get aiImages; bool get imageForEachSlide; bool get googleImage; bool get googleText; String get model; String get presentationFor;@JsonKey(includeIfNull: false) Watermark? get watermark;
/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationRequestCopyWith<PresentationRequest> get copyWith => _$PresentationRequestCopyWithImpl<PresentationRequest>(this as PresentationRequest, _$identity);

  /// Serializes this PresentationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationRequest&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.email, email) || other.email == email)&&(identical(other.accessId, accessId) || other.accessId == accessId)&&(identical(other.template, template) || other.template == template)&&(identical(other.slideCount, slideCount) || other.slideCount == slideCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.aiImages, aiImages) || other.aiImages == aiImages)&&(identical(other.imageForEachSlide, imageForEachSlide) || other.imageForEachSlide == imageForEachSlide)&&(identical(other.googleImage, googleImage) || other.googleImage == googleImage)&&(identical(other.googleText, googleText) || other.googleText == googleText)&&(identical(other.model, model) || other.model == model)&&(identical(other.presentationFor, presentationFor) || other.presentationFor == presentationFor)&&(identical(other.watermark, watermark) || other.watermark == watermark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,email,accessId,template,slideCount,language,aiImages,imageForEachSlide,googleImage,googleText,model,presentationFor,watermark);

@override
String toString() {
  return 'PresentationRequest(topic: $topic, email: $email, accessId: $accessId, template: $template, slideCount: $slideCount, language: $language, aiImages: $aiImages, imageForEachSlide: $imageForEachSlide, googleImage: $googleImage, googleText: $googleText, model: $model, presentationFor: $presentationFor, watermark: $watermark)';
}


}

/// @nodoc
abstract mixin class $PresentationRequestCopyWith<$Res>  {
  factory $PresentationRequestCopyWith(PresentationRequest value, $Res Function(PresentationRequest) _then) = _$PresentationRequestCopyWithImpl;
@useResult
$Res call({
 String topic, String email, String accessId, String template, int slideCount, String language, bool aiImages, bool imageForEachSlide, bool googleImage, bool googleText, String model, String presentationFor,@JsonKey(includeIfNull: false) Watermark? watermark
});


$WatermarkCopyWith<$Res>? get watermark;

}
/// @nodoc
class _$PresentationRequestCopyWithImpl<$Res>
    implements $PresentationRequestCopyWith<$Res> {
  _$PresentationRequestCopyWithImpl(this._self, this._then);

  final PresentationRequest _self;
  final $Res Function(PresentationRequest) _then;

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? email = null,Object? accessId = null,Object? template = null,Object? slideCount = null,Object? language = null,Object? aiImages = null,Object? imageForEachSlide = null,Object? googleImage = null,Object? googleText = null,Object? model = null,Object? presentationFor = null,Object? watermark = freezed,}) {
  return _then(_self.copyWith(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,accessId: null == accessId ? _self.accessId : accessId // ignore: cast_nullable_to_non_nullable
as String,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String,slideCount: null == slideCount ? _self.slideCount : slideCount // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,aiImages: null == aiImages ? _self.aiImages : aiImages // ignore: cast_nullable_to_non_nullable
as bool,imageForEachSlide: null == imageForEachSlide ? _self.imageForEachSlide : imageForEachSlide // ignore: cast_nullable_to_non_nullable
as bool,googleImage: null == googleImage ? _self.googleImage : googleImage // ignore: cast_nullable_to_non_nullable
as bool,googleText: null == googleText ? _self.googleText : googleText // ignore: cast_nullable_to_non_nullable
as bool,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,presentationFor: null == presentationFor ? _self.presentationFor : presentationFor // ignore: cast_nullable_to_non_nullable
as String,watermark: freezed == watermark ? _self.watermark : watermark // ignore: cast_nullable_to_non_nullable
as Watermark?,
  ));
}
/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatermarkCopyWith<$Res>? get watermark {
    if (_self.watermark == null) {
    return null;
  }

  return $WatermarkCopyWith<$Res>(_self.watermark!, (value) {
    return _then(_self.copyWith(watermark: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresentationRequest].
extension PresentationRequestPatterns on PresentationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationRequest value)  $default,){
final _that = this;
switch (_that) {
case _PresentationRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String topic,  String email,  String accessId,  String template,  int slideCount,  String language,  bool aiImages,  bool imageForEachSlide,  bool googleImage,  bool googleText,  String model,  String presentationFor, @JsonKey(includeIfNull: false)  Watermark? watermark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
return $default(_that.topic,_that.email,_that.accessId,_that.template,_that.slideCount,_that.language,_that.aiImages,_that.imageForEachSlide,_that.googleImage,_that.googleText,_that.model,_that.presentationFor,_that.watermark);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String topic,  String email,  String accessId,  String template,  int slideCount,  String language,  bool aiImages,  bool imageForEachSlide,  bool googleImage,  bool googleText,  String model,  String presentationFor, @JsonKey(includeIfNull: false)  Watermark? watermark)  $default,) {final _that = this;
switch (_that) {
case _PresentationRequest():
return $default(_that.topic,_that.email,_that.accessId,_that.template,_that.slideCount,_that.language,_that.aiImages,_that.imageForEachSlide,_that.googleImage,_that.googleText,_that.model,_that.presentationFor,_that.watermark);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String topic,  String email,  String accessId,  String template,  int slideCount,  String language,  bool aiImages,  bool imageForEachSlide,  bool googleImage,  bool googleText,  String model,  String presentationFor, @JsonKey(includeIfNull: false)  Watermark? watermark)?  $default,) {final _that = this;
switch (_that) {
case _PresentationRequest() when $default != null:
return $default(_that.topic,_that.email,_that.accessId,_that.template,_that.slideCount,_that.language,_that.aiImages,_that.imageForEachSlide,_that.googleImage,_that.googleText,_that.model,_that.presentationFor,_that.watermark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresentationRequest implements PresentationRequest {
  const _PresentationRequest({required this.topic, required this.email, required this.accessId, required this.template, this.slideCount = 10, this.language = 'en', this.aiImages = true, this.imageForEachSlide = true, this.googleImage = false, this.googleText = false, this.model = 'gpt-4', this.presentationFor = 'student', @JsonKey(includeIfNull: false) this.watermark});
  factory _PresentationRequest.fromJson(Map<String, dynamic> json) => _$PresentationRequestFromJson(json);

@override final  String topic;
@override final  String email;
@override final  String accessId;
@override final  String template;
@override@JsonKey() final  int slideCount;
@override@JsonKey() final  String language;
@override@JsonKey() final  bool aiImages;
@override@JsonKey() final  bool imageForEachSlide;
@override@JsonKey() final  bool googleImage;
@override@JsonKey() final  bool googleText;
@override@JsonKey() final  String model;
@override@JsonKey() final  String presentationFor;
@override@JsonKey(includeIfNull: false) final  Watermark? watermark;

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationRequestCopyWith<_PresentationRequest> get copyWith => __$PresentationRequestCopyWithImpl<_PresentationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresentationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationRequest&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.email, email) || other.email == email)&&(identical(other.accessId, accessId) || other.accessId == accessId)&&(identical(other.template, template) || other.template == template)&&(identical(other.slideCount, slideCount) || other.slideCount == slideCount)&&(identical(other.language, language) || other.language == language)&&(identical(other.aiImages, aiImages) || other.aiImages == aiImages)&&(identical(other.imageForEachSlide, imageForEachSlide) || other.imageForEachSlide == imageForEachSlide)&&(identical(other.googleImage, googleImage) || other.googleImage == googleImage)&&(identical(other.googleText, googleText) || other.googleText == googleText)&&(identical(other.model, model) || other.model == model)&&(identical(other.presentationFor, presentationFor) || other.presentationFor == presentationFor)&&(identical(other.watermark, watermark) || other.watermark == watermark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,email,accessId,template,slideCount,language,aiImages,imageForEachSlide,googleImage,googleText,model,presentationFor,watermark);

@override
String toString() {
  return 'PresentationRequest(topic: $topic, email: $email, accessId: $accessId, template: $template, slideCount: $slideCount, language: $language, aiImages: $aiImages, imageForEachSlide: $imageForEachSlide, googleImage: $googleImage, googleText: $googleText, model: $model, presentationFor: $presentationFor, watermark: $watermark)';
}


}

/// @nodoc
abstract mixin class _$PresentationRequestCopyWith<$Res> implements $PresentationRequestCopyWith<$Res> {
  factory _$PresentationRequestCopyWith(_PresentationRequest value, $Res Function(_PresentationRequest) _then) = __$PresentationRequestCopyWithImpl;
@override @useResult
$Res call({
 String topic, String email, String accessId, String template, int slideCount, String language, bool aiImages, bool imageForEachSlide, bool googleImage, bool googleText, String model, String presentationFor,@JsonKey(includeIfNull: false) Watermark? watermark
});


@override $WatermarkCopyWith<$Res>? get watermark;

}
/// @nodoc
class __$PresentationRequestCopyWithImpl<$Res>
    implements _$PresentationRequestCopyWith<$Res> {
  __$PresentationRequestCopyWithImpl(this._self, this._then);

  final _PresentationRequest _self;
  final $Res Function(_PresentationRequest) _then;

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? email = null,Object? accessId = null,Object? template = null,Object? slideCount = null,Object? language = null,Object? aiImages = null,Object? imageForEachSlide = null,Object? googleImage = null,Object? googleText = null,Object? model = null,Object? presentationFor = null,Object? watermark = freezed,}) {
  return _then(_PresentationRequest(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,accessId: null == accessId ? _self.accessId : accessId // ignore: cast_nullable_to_non_nullable
as String,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as String,slideCount: null == slideCount ? _self.slideCount : slideCount // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,aiImages: null == aiImages ? _self.aiImages : aiImages // ignore: cast_nullable_to_non_nullable
as bool,imageForEachSlide: null == imageForEachSlide ? _self.imageForEachSlide : imageForEachSlide // ignore: cast_nullable_to_non_nullable
as bool,googleImage: null == googleImage ? _self.googleImage : googleImage // ignore: cast_nullable_to_non_nullable
as bool,googleText: null == googleText ? _self.googleText : googleText // ignore: cast_nullable_to_non_nullable
as bool,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,presentationFor: null == presentationFor ? _self.presentationFor : presentationFor // ignore: cast_nullable_to_non_nullable
as String,watermark: freezed == watermark ? _self.watermark : watermark // ignore: cast_nullable_to_non_nullable
as Watermark?,
  ));
}

/// Create a copy of PresentationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatermarkCopyWith<$Res>? get watermark {
    if (_self.watermark == null) {
    return null;
  }

  return $WatermarkCopyWith<$Res>(_self.watermark!, (value) {
    return _then(_self.copyWith(watermark: value));
  });
}
}

// dart format on
