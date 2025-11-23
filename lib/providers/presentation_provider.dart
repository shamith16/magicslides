import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:chopper/chopper.dart';
import '../data/remote/magic_slides_service.dart';
import '../data/remote/logging_interceptor.dart';
import '../data/models/presentation_request.dart';
import '../data/models/presentation_response.dart';
import '../core/failure.dart';
import '../core/error_converter.dart';
import '../core/logger.dart';

part 'presentation_provider.g.dart';

@Riverpod(keepAlive: true)
MagicSlidesService magicSlidesService(Ref ref) {
  final client = ChopperClient(
    baseUrl: Uri.parse('https://api.magicslides.app'),
    services: [MagicSlidesService.create()],
    converter: const JsonConverter(),
    interceptors: [
      PrettyLoggingInterceptor(),
      ErrorHandlingInterceptor(),
    ],
  );
  return client.getService<MagicSlidesService>();
}

@riverpod
class PresentationNotifier extends _$PresentationNotifier {
  @override
  Future<PresentationResponse?> build() async {
    return null;
  }

  Future<void> generatePresentation(PresentationRequest request) async {
    if (state.isLoading) {
      // Prevent duplicate submissions while a request is in flight
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = ref.read(magicSlidesServiceProvider);
      final response = await service.generatePresentation(request);

      if (!response.isSuccessful) {
        // Error converter should have thrown, but handle fallback
        throw Failure.fromHttpResponse(
          response.statusCode,
          response.bodyString,
        );
      }

      final body = response.body;
      if (body == null) {
        throw const Failure.network(
          message: 'Empty response from server',
        );
      }

      try {
        // Handle nested data structure - flatten if needed
        Map<String, dynamic> responseData = Map<String, dynamic>.from(body);
        
        // If data is nested and contains fields we expect at root, flatten them
        if (responseData.containsKey('data') && 
            responseData['data'] is Map<String, dynamic>) {
          final dataMap = responseData['data'] as Map<String, dynamic>;
          // Merge data fields into root if they don't already exist at root
          dataMap.forEach((key, value) {
            if (!responseData.containsKey(key)) {
              responseData[key] = value;
            }
          });
        }
        
        return PresentationResponse.fromJson(responseData);
      } catch (parseError, parseSt) {
        Logger.error('JSON parsing failed', parseError, parseSt);
        Logger.debug('Response body: $body');
        throw Failure.unexpected(
          message: 'Failed to parse server response',
          originalError: parseError,
        );
      }
    });
  }
}
