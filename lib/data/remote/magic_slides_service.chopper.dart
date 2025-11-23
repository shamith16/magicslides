// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_slides_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MagicSlidesService extends MagicSlidesService {
  _$MagicSlidesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MagicSlidesService;

  @override
  Future<Response<Map<String, dynamic>>> generatePresentation(
    PresentationRequest body,
  ) {
    final Uri $url = Uri.parse('/public/api/ppt_from_topic');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
