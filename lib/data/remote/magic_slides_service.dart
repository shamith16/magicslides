import 'package:chopper/chopper.dart';
import '../models/presentation_request.dart';

part 'magic_slides_service.chopper.dart';

@ChopperApi(baseUrl: '/public/api')
abstract class MagicSlidesService extends ChopperService {
  static MagicSlidesService create([ChopperClient? client]) {
    // Require a client or create a default one
    final chopperClient = client ??
        ChopperClient(
          baseUrl: Uri.parse('https://api.magicslides.app'),
        );
    return _$MagicSlidesService(chopperClient);
  }

  @POST(path: '/ppt_from_topic')
  Future<Response<Map<String, dynamic>>> generatePresentation(
    @Body() PresentationRequest body,
  );
}
