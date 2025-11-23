import 'package:freezed_annotation/freezed_annotation.dart';

part 'watermark.freezed.dart';
part 'watermark.g.dart';

@freezed
abstract class Watermark with _$Watermark {
  const factory Watermark({
    required String width,
    required String height,
    required String brandURL,
    required String position,
  }) = _Watermark;

  factory Watermark.fromJson(Map<String, dynamic> json) =>
      _$WatermarkFromJson(json);
}
