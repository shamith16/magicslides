// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresentationResponse {

@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false) bool get success; String? get message; String? get presentationSubtitle; String? get imageSearch; List<PresentationSlide>? get slides; String? get pptId;@JsonKey(name: 'UserMessage') String? get userMessage; int? get openAICallTime; int? get tokenUsed; String? get pdfUrl; String? get model; String? get customStartGenerationTime; PresentationData? get data;
/// Create a copy of PresentationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationResponseCopyWith<PresentationResponse> get copyWith => _$PresentationResponseCopyWithImpl<PresentationResponse>(this as PresentationResponse, _$identity);

  /// Serializes this PresentationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.presentationSubtitle, presentationSubtitle) || other.presentationSubtitle == presentationSubtitle)&&(identical(other.imageSearch, imageSearch) || other.imageSearch == imageSearch)&&const DeepCollectionEquality().equals(other.slides, slides)&&(identical(other.pptId, pptId) || other.pptId == pptId)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&(identical(other.openAICallTime, openAICallTime) || other.openAICallTime == openAICallTime)&&(identical(other.tokenUsed, tokenUsed) || other.tokenUsed == tokenUsed)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.model, model) || other.model == model)&&(identical(other.customStartGenerationTime, customStartGenerationTime) || other.customStartGenerationTime == customStartGenerationTime)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,presentationSubtitle,imageSearch,const DeepCollectionEquality().hash(slides),pptId,userMessage,openAICallTime,tokenUsed,pdfUrl,model,customStartGenerationTime,data);

@override
String toString() {
  return 'PresentationResponse(success: $success, message: $message, presentationSubtitle: $presentationSubtitle, imageSearch: $imageSearch, slides: $slides, pptId: $pptId, userMessage: $userMessage, openAICallTime: $openAICallTime, tokenUsed: $tokenUsed, pdfUrl: $pdfUrl, model: $model, customStartGenerationTime: $customStartGenerationTime, data: $data)';
}


}

/// @nodoc
abstract mixin class $PresentationResponseCopyWith<$Res>  {
  factory $PresentationResponseCopyWith(PresentationResponse value, $Res Function(PresentationResponse) _then) = _$PresentationResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false) bool success, String? message, String? presentationSubtitle, String? imageSearch, List<PresentationSlide>? slides, String? pptId,@JsonKey(name: 'UserMessage') String? userMessage, int? openAICallTime, int? tokenUsed, String? pdfUrl, String? model, String? customStartGenerationTime, PresentationData? data
});


$PresentationDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PresentationResponseCopyWithImpl<$Res>
    implements $PresentationResponseCopyWith<$Res> {
  _$PresentationResponseCopyWithImpl(this._self, this._then);

  final PresentationResponse _self;
  final $Res Function(PresentationResponse) _then;

/// Create a copy of PresentationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = freezed,Object? presentationSubtitle = freezed,Object? imageSearch = freezed,Object? slides = freezed,Object? pptId = freezed,Object? userMessage = freezed,Object? openAICallTime = freezed,Object? tokenUsed = freezed,Object? pdfUrl = freezed,Object? model = freezed,Object? customStartGenerationTime = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,presentationSubtitle: freezed == presentationSubtitle ? _self.presentationSubtitle : presentationSubtitle // ignore: cast_nullable_to_non_nullable
as String?,imageSearch: freezed == imageSearch ? _self.imageSearch : imageSearch // ignore: cast_nullable_to_non_nullable
as String?,slides: freezed == slides ? _self.slides : slides // ignore: cast_nullable_to_non_nullable
as List<PresentationSlide>?,pptId: freezed == pptId ? _self.pptId : pptId // ignore: cast_nullable_to_non_nullable
as String?,userMessage: freezed == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String?,openAICallTime: freezed == openAICallTime ? _self.openAICallTime : openAICallTime // ignore: cast_nullable_to_non_nullable
as int?,tokenUsed: freezed == tokenUsed ? _self.tokenUsed : tokenUsed // ignore: cast_nullable_to_non_nullable
as int?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,customStartGenerationTime: freezed == customStartGenerationTime ? _self.customStartGenerationTime : customStartGenerationTime // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PresentationData?,
  ));
}
/// Create a copy of PresentationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresentationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PresentationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresentationResponse].
extension PresentationResponsePatterns on PresentationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationResponse value)  $default,){
final _that = this;
switch (_that) {
case _PresentationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false)  bool success,  String? message,  String? presentationSubtitle,  String? imageSearch,  List<PresentationSlide>? slides,  String? pptId, @JsonKey(name: 'UserMessage')  String? userMessage,  int? openAICallTime,  int? tokenUsed,  String? pdfUrl,  String? model,  String? customStartGenerationTime,  PresentationData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationResponse() when $default != null:
return $default(_that.success,_that.message,_that.presentationSubtitle,_that.imageSearch,_that.slides,_that.pptId,_that.userMessage,_that.openAICallTime,_that.tokenUsed,_that.pdfUrl,_that.model,_that.customStartGenerationTime,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false)  bool success,  String? message,  String? presentationSubtitle,  String? imageSearch,  List<PresentationSlide>? slides,  String? pptId, @JsonKey(name: 'UserMessage')  String? userMessage,  int? openAICallTime,  int? tokenUsed,  String? pdfUrl,  String? model,  String? customStartGenerationTime,  PresentationData? data)  $default,) {final _that = this;
switch (_that) {
case _PresentationResponse():
return $default(_that.success,_that.message,_that.presentationSubtitle,_that.imageSearch,_that.slides,_that.pptId,_that.userMessage,_that.openAICallTime,_that.tokenUsed,_that.pdfUrl,_that.model,_that.customStartGenerationTime,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false)  bool success,  String? message,  String? presentationSubtitle,  String? imageSearch,  List<PresentationSlide>? slides,  String? pptId, @JsonKey(name: 'UserMessage')  String? userMessage,  int? openAICallTime,  int? tokenUsed,  String? pdfUrl,  String? model,  String? customStartGenerationTime,  PresentationData? data)?  $default,) {final _that = this;
switch (_that) {
case _PresentationResponse() when $default != null:
return $default(_that.success,_that.message,_that.presentationSubtitle,_that.imageSearch,_that.slides,_that.pptId,_that.userMessage,_that.openAICallTime,_that.tokenUsed,_that.pdfUrl,_that.model,_that.customStartGenerationTime,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresentationResponse implements PresentationResponse {
  const _PresentationResponse({@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false) required this.success, this.message, this.presentationSubtitle, this.imageSearch, final  List<PresentationSlide>? slides, this.pptId, @JsonKey(name: 'UserMessage') this.userMessage, this.openAICallTime, this.tokenUsed, this.pdfUrl, this.model, this.customStartGenerationTime, this.data}): _slides = slides;
  factory _PresentationResponse.fromJson(Map<String, dynamic> json) => _$PresentationResponseFromJson(json);

@override@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false) final  bool success;
@override final  String? message;
@override final  String? presentationSubtitle;
@override final  String? imageSearch;
 final  List<PresentationSlide>? _slides;
@override List<PresentationSlide>? get slides {
  final value = _slides;
  if (value == null) return null;
  if (_slides is EqualUnmodifiableListView) return _slides;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? pptId;
@override@JsonKey(name: 'UserMessage') final  String? userMessage;
@override final  int? openAICallTime;
@override final  int? tokenUsed;
@override final  String? pdfUrl;
@override final  String? model;
@override final  String? customStartGenerationTime;
@override final  PresentationData? data;

/// Create a copy of PresentationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationResponseCopyWith<_PresentationResponse> get copyWith => __$PresentationResponseCopyWithImpl<_PresentationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresentationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.presentationSubtitle, presentationSubtitle) || other.presentationSubtitle == presentationSubtitle)&&(identical(other.imageSearch, imageSearch) || other.imageSearch == imageSearch)&&const DeepCollectionEquality().equals(other._slides, _slides)&&(identical(other.pptId, pptId) || other.pptId == pptId)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage)&&(identical(other.openAICallTime, openAICallTime) || other.openAICallTime == openAICallTime)&&(identical(other.tokenUsed, tokenUsed) || other.tokenUsed == tokenUsed)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.model, model) || other.model == model)&&(identical(other.customStartGenerationTime, customStartGenerationTime) || other.customStartGenerationTime == customStartGenerationTime)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,presentationSubtitle,imageSearch,const DeepCollectionEquality().hash(_slides),pptId,userMessage,openAICallTime,tokenUsed,pdfUrl,model,customStartGenerationTime,data);

@override
String toString() {
  return 'PresentationResponse(success: $success, message: $message, presentationSubtitle: $presentationSubtitle, imageSearch: $imageSearch, slides: $slides, pptId: $pptId, userMessage: $userMessage, openAICallTime: $openAICallTime, tokenUsed: $tokenUsed, pdfUrl: $pdfUrl, model: $model, customStartGenerationTime: $customStartGenerationTime, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PresentationResponseCopyWith<$Res> implements $PresentationResponseCopyWith<$Res> {
  factory _$PresentationResponseCopyWith(_PresentationResponse value, $Res Function(_PresentationResponse) _then) = __$PresentationResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status', fromJson: _statusToBool, defaultValue: false) bool success, String? message, String? presentationSubtitle, String? imageSearch, List<PresentationSlide>? slides, String? pptId,@JsonKey(name: 'UserMessage') String? userMessage, int? openAICallTime, int? tokenUsed, String? pdfUrl, String? model, String? customStartGenerationTime, PresentationData? data
});


@override $PresentationDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PresentationResponseCopyWithImpl<$Res>
    implements _$PresentationResponseCopyWith<$Res> {
  __$PresentationResponseCopyWithImpl(this._self, this._then);

  final _PresentationResponse _self;
  final $Res Function(_PresentationResponse) _then;

/// Create a copy of PresentationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = freezed,Object? presentationSubtitle = freezed,Object? imageSearch = freezed,Object? slides = freezed,Object? pptId = freezed,Object? userMessage = freezed,Object? openAICallTime = freezed,Object? tokenUsed = freezed,Object? pdfUrl = freezed,Object? model = freezed,Object? customStartGenerationTime = freezed,Object? data = freezed,}) {
  return _then(_PresentationResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,presentationSubtitle: freezed == presentationSubtitle ? _self.presentationSubtitle : presentationSubtitle // ignore: cast_nullable_to_non_nullable
as String?,imageSearch: freezed == imageSearch ? _self.imageSearch : imageSearch // ignore: cast_nullable_to_non_nullable
as String?,slides: freezed == slides ? _self._slides : slides // ignore: cast_nullable_to_non_nullable
as List<PresentationSlide>?,pptId: freezed == pptId ? _self.pptId : pptId // ignore: cast_nullable_to_non_nullable
as String?,userMessage: freezed == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String?,openAICallTime: freezed == openAICallTime ? _self.openAICallTime : openAICallTime // ignore: cast_nullable_to_non_nullable
as int?,tokenUsed: freezed == tokenUsed ? _self.tokenUsed : tokenUsed // ignore: cast_nullable_to_non_nullable
as int?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,customStartGenerationTime: freezed == customStartGenerationTime ? _self.customStartGenerationTime : customStartGenerationTime // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PresentationData?,
  ));
}

/// Create a copy of PresentationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PresentationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PresentationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PresentationSlide {

 String get title; String? get subtitle; String? get imageSearch; List<PresentationSlideContent>? get content;
/// Create a copy of PresentationSlide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationSlideCopyWith<PresentationSlide> get copyWith => _$PresentationSlideCopyWithImpl<PresentationSlide>(this as PresentationSlide, _$identity);

  /// Serializes this PresentationSlide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationSlide&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageSearch, imageSearch) || other.imageSearch == imageSearch)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,imageSearch,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'PresentationSlide(title: $title, subtitle: $subtitle, imageSearch: $imageSearch, content: $content)';
}


}

/// @nodoc
abstract mixin class $PresentationSlideCopyWith<$Res>  {
  factory $PresentationSlideCopyWith(PresentationSlide value, $Res Function(PresentationSlide) _then) = _$PresentationSlideCopyWithImpl;
@useResult
$Res call({
 String title, String? subtitle, String? imageSearch, List<PresentationSlideContent>? content
});




}
/// @nodoc
class _$PresentationSlideCopyWithImpl<$Res>
    implements $PresentationSlideCopyWith<$Res> {
  _$PresentationSlideCopyWithImpl(this._self, this._then);

  final PresentationSlide _self;
  final $Res Function(PresentationSlide) _then;

/// Create a copy of PresentationSlide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = freezed,Object? imageSearch = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageSearch: freezed == imageSearch ? _self.imageSearch : imageSearch // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<PresentationSlideContent>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationSlide].
extension PresentationSlidePatterns on PresentationSlide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationSlide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationSlide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationSlide value)  $default,){
final _that = this;
switch (_that) {
case _PresentationSlide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationSlide value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationSlide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? subtitle,  String? imageSearch,  List<PresentationSlideContent>? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationSlide() when $default != null:
return $default(_that.title,_that.subtitle,_that.imageSearch,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? subtitle,  String? imageSearch,  List<PresentationSlideContent>? content)  $default,) {final _that = this;
switch (_that) {
case _PresentationSlide():
return $default(_that.title,_that.subtitle,_that.imageSearch,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? subtitle,  String? imageSearch,  List<PresentationSlideContent>? content)?  $default,) {final _that = this;
switch (_that) {
case _PresentationSlide() when $default != null:
return $default(_that.title,_that.subtitle,_that.imageSearch,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresentationSlide implements PresentationSlide {
  const _PresentationSlide({required this.title, this.subtitle, this.imageSearch, final  List<PresentationSlideContent>? content}): _content = content;
  factory _PresentationSlide.fromJson(Map<String, dynamic> json) => _$PresentationSlideFromJson(json);

@override final  String title;
@override final  String? subtitle;
@override final  String? imageSearch;
 final  List<PresentationSlideContent>? _content;
@override List<PresentationSlideContent>? get content {
  final value = _content;
  if (value == null) return null;
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PresentationSlide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationSlideCopyWith<_PresentationSlide> get copyWith => __$PresentationSlideCopyWithImpl<_PresentationSlide>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresentationSlideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationSlide&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageSearch, imageSearch) || other.imageSearch == imageSearch)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,imageSearch,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'PresentationSlide(title: $title, subtitle: $subtitle, imageSearch: $imageSearch, content: $content)';
}


}

/// @nodoc
abstract mixin class _$PresentationSlideCopyWith<$Res> implements $PresentationSlideCopyWith<$Res> {
  factory _$PresentationSlideCopyWith(_PresentationSlide value, $Res Function(_PresentationSlide) _then) = __$PresentationSlideCopyWithImpl;
@override @useResult
$Res call({
 String title, String? subtitle, String? imageSearch, List<PresentationSlideContent>? content
});




}
/// @nodoc
class __$PresentationSlideCopyWithImpl<$Res>
    implements _$PresentationSlideCopyWith<$Res> {
  __$PresentationSlideCopyWithImpl(this._self, this._then);

  final _PresentationSlide _self;
  final $Res Function(_PresentationSlide) _then;

/// Create a copy of PresentationSlide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = freezed,Object? imageSearch = freezed,Object? content = freezed,}) {
  return _then(_PresentationSlide(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageSearch: freezed == imageSearch ? _self.imageSearch : imageSearch // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<PresentationSlideContent>?,
  ));
}


}


/// @nodoc
mixin _$PresentationSlideContent {

 String get title; String get description;
/// Create a copy of PresentationSlideContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationSlideContentCopyWith<PresentationSlideContent> get copyWith => _$PresentationSlideContentCopyWithImpl<PresentationSlideContent>(this as PresentationSlideContent, _$identity);

  /// Serializes this PresentationSlideContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationSlideContent&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'PresentationSlideContent(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $PresentationSlideContentCopyWith<$Res>  {
  factory $PresentationSlideContentCopyWith(PresentationSlideContent value, $Res Function(PresentationSlideContent) _then) = _$PresentationSlideContentCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$PresentationSlideContentCopyWithImpl<$Res>
    implements $PresentationSlideContentCopyWith<$Res> {
  _$PresentationSlideContentCopyWithImpl(this._self, this._then);

  final PresentationSlideContent _self;
  final $Res Function(PresentationSlideContent) _then;

/// Create a copy of PresentationSlideContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationSlideContent].
extension PresentationSlideContentPatterns on PresentationSlideContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationSlideContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationSlideContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationSlideContent value)  $default,){
final _that = this;
switch (_that) {
case _PresentationSlideContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationSlideContent value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationSlideContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationSlideContent() when $default != null:
return $default(_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _PresentationSlideContent():
return $default(_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _PresentationSlideContent() when $default != null:
return $default(_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresentationSlideContent implements PresentationSlideContent {
  const _PresentationSlideContent({required this.title, required this.description});
  factory _PresentationSlideContent.fromJson(Map<String, dynamic> json) => _$PresentationSlideContentFromJson(json);

@override final  String title;
@override final  String description;

/// Create a copy of PresentationSlideContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationSlideContentCopyWith<_PresentationSlideContent> get copyWith => __$PresentationSlideContentCopyWithImpl<_PresentationSlideContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresentationSlideContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationSlideContent&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'PresentationSlideContent(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PresentationSlideContentCopyWith<$Res> implements $PresentationSlideContentCopyWith<$Res> {
  factory _$PresentationSlideContentCopyWith(_PresentationSlideContent value, $Res Function(_PresentationSlideContent) _then) = __$PresentationSlideContentCopyWithImpl;
@override @useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class __$PresentationSlideContentCopyWithImpl<$Res>
    implements _$PresentationSlideContentCopyWith<$Res> {
  __$PresentationSlideContentCopyWithImpl(this._self, this._then);

  final _PresentationSlideContent _self;
  final $Res Function(_PresentationSlideContent) _then;

/// Create a copy of PresentationSlideContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(_PresentationSlideContent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PresentationData {

 String? get message; String? get presentationId; String? get url; String? get pptId; bool? get error;
/// Create a copy of PresentationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationDataCopyWith<PresentationData> get copyWith => _$PresentationDataCopyWithImpl<PresentationData>(this as PresentationData, _$identity);

  /// Serializes this PresentationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationData&&(identical(other.message, message) || other.message == message)&&(identical(other.presentationId, presentationId) || other.presentationId == presentationId)&&(identical(other.url, url) || other.url == url)&&(identical(other.pptId, pptId) || other.pptId == pptId)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,presentationId,url,pptId,error);

@override
String toString() {
  return 'PresentationData(message: $message, presentationId: $presentationId, url: $url, pptId: $pptId, error: $error)';
}


}

/// @nodoc
abstract mixin class $PresentationDataCopyWith<$Res>  {
  factory $PresentationDataCopyWith(PresentationData value, $Res Function(PresentationData) _then) = _$PresentationDataCopyWithImpl;
@useResult
$Res call({
 String? message, String? presentationId, String? url, String? pptId, bool? error
});




}
/// @nodoc
class _$PresentationDataCopyWithImpl<$Res>
    implements $PresentationDataCopyWith<$Res> {
  _$PresentationDataCopyWithImpl(this._self, this._then);

  final PresentationData _self;
  final $Res Function(PresentationData) _then;

/// Create a copy of PresentationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? presentationId = freezed,Object? url = freezed,Object? pptId = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,presentationId: freezed == presentationId ? _self.presentationId : presentationId // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,pptId: freezed == pptId ? _self.pptId : pptId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationData].
extension PresentationDataPatterns on PresentationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationData value)  $default,){
final _that = this;
switch (_that) {
case _PresentationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationData value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? message,  String? presentationId,  String? url,  String? pptId,  bool? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationData() when $default != null:
return $default(_that.message,_that.presentationId,_that.url,_that.pptId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? message,  String? presentationId,  String? url,  String? pptId,  bool? error)  $default,) {final _that = this;
switch (_that) {
case _PresentationData():
return $default(_that.message,_that.presentationId,_that.url,_that.pptId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? message,  String? presentationId,  String? url,  String? pptId,  bool? error)?  $default,) {final _that = this;
switch (_that) {
case _PresentationData() when $default != null:
return $default(_that.message,_that.presentationId,_that.url,_that.pptId,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresentationData implements PresentationData {
  const _PresentationData({this.message, this.presentationId, this.url, this.pptId, this.error});
  factory _PresentationData.fromJson(Map<String, dynamic> json) => _$PresentationDataFromJson(json);

@override final  String? message;
@override final  String? presentationId;
@override final  String? url;
@override final  String? pptId;
@override final  bool? error;

/// Create a copy of PresentationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationDataCopyWith<_PresentationData> get copyWith => __$PresentationDataCopyWithImpl<_PresentationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresentationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationData&&(identical(other.message, message) || other.message == message)&&(identical(other.presentationId, presentationId) || other.presentationId == presentationId)&&(identical(other.url, url) || other.url == url)&&(identical(other.pptId, pptId) || other.pptId == pptId)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,presentationId,url,pptId,error);

@override
String toString() {
  return 'PresentationData(message: $message, presentationId: $presentationId, url: $url, pptId: $pptId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PresentationDataCopyWith<$Res> implements $PresentationDataCopyWith<$Res> {
  factory _$PresentationDataCopyWith(_PresentationData value, $Res Function(_PresentationData) _then) = __$PresentationDataCopyWithImpl;
@override @useResult
$Res call({
 String? message, String? presentationId, String? url, String? pptId, bool? error
});




}
/// @nodoc
class __$PresentationDataCopyWithImpl<$Res>
    implements _$PresentationDataCopyWith<$Res> {
  __$PresentationDataCopyWithImpl(this._self, this._then);

  final _PresentationData _self;
  final $Res Function(_PresentationData) _then;

/// Create a copy of PresentationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? presentationId = freezed,Object? url = freezed,Object? pptId = freezed,Object? error = freezed,}) {
  return _then(_PresentationData(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,presentationId: freezed == presentationId ? _self.presentationId : presentationId // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,pptId: freezed == pptId ? _self.pptId : pptId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
