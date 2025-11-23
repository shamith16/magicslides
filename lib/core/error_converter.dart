import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;
import 'failure.dart';
import 'logger.dart';

/// Chopper interceptor that converts HTTP errors into Failure types
class ErrorHandlingInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final response = await chain.proceed(chain.request);

    // Convert non-successful responses to failures
    if (!response.isSuccessful) {
      final statusCode = response.statusCode;
      final body = response.bodyString;

      Logger.error(
        'HTTP error: $statusCode',
        body,
      );

      final failure = Failure.fromHttpResponse(statusCode, body);
      throw failure;
    }

    return response;
  }
}

/// HTTP client wrapper with timeout and error handling
class HttpClientWithTimeout {
  static const Duration _defaultTimeout = Duration(seconds: 30);

  /// Performs GET request with timeout and error handling
  static Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    try {
      final response = await http
          .get(url, headers: headers)
          .timeout(timeout ?? _defaultTimeout);

      // Check status code
      if (response.statusCode >= 400) {
        final failure = Failure.fromHttpResponse(
          response.statusCode,
          response.body,
        );
        Logger.logFailure(failure);
        throw failure;
      }

      return response;
    } on TimeoutException {
      Logger.error('Request timeout: $url');
      throw const Failure.network(
        message: 'Request timed out. Please try again.',
      );
    } on Failure {
      rethrow;
    } catch (e, st) {
      Logger.error('Unexpected error during HTTP request', e, st);
      throw Failure.fromException(e, st);
    }
  }
}

