// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watermark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Watermark {

 String get width; String get height; String get brandURL; String get position;
/// Create a copy of Watermark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatermarkCopyWith<Watermark> get copyWith => _$WatermarkCopyWithImpl<Watermark>(this as Watermark, _$identity);

  /// Serializes this Watermark to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Watermark&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.brandURL, brandURL) || other.brandURL == brandURL)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,brandURL,position);

@override
String toString() {
  return 'Watermark(width: $width, height: $height, brandURL: $brandURL, position: $position)';
}


}

/// @nodoc
abstract mixin class $WatermarkCopyWith<$Res>  {
  factory $WatermarkCopyWith(Watermark value, $Res Function(Watermark) _then) = _$WatermarkCopyWithImpl;
@useResult
$Res call({
 String width, String height, String brandURL, String position
});




}
/// @nodoc
class _$WatermarkCopyWithImpl<$Res>
    implements $WatermarkCopyWith<$Res> {
  _$WatermarkCopyWithImpl(this._self, this._then);

  final Watermark _self;
  final $Res Function(Watermark) _then;

/// Create a copy of Watermark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? height = null,Object? brandURL = null,Object? position = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String,brandURL: null == brandURL ? _self.brandURL : brandURL // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Watermark].
extension WatermarkPatterns on Watermark {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Watermark value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Watermark() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Watermark value)  $default,){
final _that = this;
switch (_that) {
case _Watermark():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Watermark value)?  $default,){
final _that = this;
switch (_that) {
case _Watermark() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String width,  String height,  String brandURL,  String position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Watermark() when $default != null:
return $default(_that.width,_that.height,_that.brandURL,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String width,  String height,  String brandURL,  String position)  $default,) {final _that = this;
switch (_that) {
case _Watermark():
return $default(_that.width,_that.height,_that.brandURL,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String width,  String height,  String brandURL,  String position)?  $default,) {final _that = this;
switch (_that) {
case _Watermark() when $default != null:
return $default(_that.width,_that.height,_that.brandURL,_that.position);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Watermark implements Watermark {
  const _Watermark({required this.width, required this.height, required this.brandURL, required this.position});
  factory _Watermark.fromJson(Map<String, dynamic> json) => _$WatermarkFromJson(json);

@override final  String width;
@override final  String height;
@override final  String brandURL;
@override final  String position;

/// Create a copy of Watermark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatermarkCopyWith<_Watermark> get copyWith => __$WatermarkCopyWithImpl<_Watermark>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatermarkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Watermark&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.brandURL, brandURL) || other.brandURL == brandURL)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,brandURL,position);

@override
String toString() {
  return 'Watermark(width: $width, height: $height, brandURL: $brandURL, position: $position)';
}


}

/// @nodoc
abstract mixin class _$WatermarkCopyWith<$Res> implements $WatermarkCopyWith<$Res> {
  factory _$WatermarkCopyWith(_Watermark value, $Res Function(_Watermark) _then) = __$WatermarkCopyWithImpl;
@override @useResult
$Res call({
 String width, String height, String brandURL, String position
});




}
/// @nodoc
class __$WatermarkCopyWithImpl<$Res>
    implements _$WatermarkCopyWith<$Res> {
  __$WatermarkCopyWithImpl(this._self, this._then);

  final _Watermark _self;
  final $Res Function(_Watermark) _then;

/// Create a copy of Watermark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,Object? brandURL = null,Object? position = null,}) {
  return _then(_Watermark(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String,brandURL: null == brandURL ? _self.brandURL : brandURL // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
