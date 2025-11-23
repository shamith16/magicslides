import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Sealed type representing different failure categories with user-friendly messages
@freezed
sealed class Failure with _$Failure {
  const Failure._();

  /// Network-related failures (timeout, connection, etc.)
  const factory Failure.network({
    required String message,
    int? statusCode,
    String? body,
  }) = NetworkFailure;

  /// Authentication failures (invalid credentials, unauthorized, etc.)
  const factory Failure.auth({
    required String message,
  }) = AuthFailure;

  /// Validation failures (invalid input, missing fields, etc.)
  const factory Failure.validation({
    required String message,
  }) = ValidationFailure;

  /// Unexpected/unhandled failures
  const factory Failure.unexpected({
    required String message,
    Object? originalError,
  }) = UnexpectedFailure;

  /// Converts failure to user-friendly message
  String get userMessage => switch (this) {
        NetworkFailure(:final message) => message,
        AuthFailure(:final message) => message,
        ValidationFailure(:final message) => message,
        UnexpectedFailure(:final message) => message,
      };

  /// Creates a Failure from an exception
  factory Failure.fromException(Object error, [StackTrace? stackTrace]) {
    final errorString = error.toString().toLowerCase();
    
    // Network errors
    if (errorString.contains('socket') ||
        errorString.contains('connection') ||
        errorString.contains('timeout') ||
        errorString.contains('network')) {
      return Failure.network(
        message: 'Connection failed. Please check your internet connection.',
      );
    }

    // HTTP errors
    if (errorString.contains('http') || errorString.contains('status')) {
      return Failure.network(
        message: 'Server error. Please try again later.',
      );
    }

    // Default to unexpected
    return Failure.unexpected(
      message: 'Something went wrong. Please try again.',
      originalError: error,
    );
  }

  /// Creates a Failure from HTTP status code and body
  factory Failure.fromHttpResponse(int statusCode, String? body) {
    String message;
    
    switch (statusCode) {
      case 400:
        message = 'Invalid request. Please check your input.';
        break;
      case 401:
        return const Failure.auth(
          message: 'Authentication failed. Please login again.',
        );
      case 403:
        return const Failure.auth(
          message: 'Access denied. You don\'t have permission.',
        );
      case 404:
        message = 'Resource not found.';
        break;
      case 408:
        message = 'Request timed out. Please try again.';
        break;
      case 429:
        message = 'Too many requests. Please wait a moment.';
        break;
      case >= 500 && < 600:
        message = 'Server error. Please try again later.';
        break;
      default:
        message = 'Request failed. Please try again.';
    }

    // Try to extract error message from body if available
    if (body != null && body.isNotEmpty) {
      try {
        // Simple JSON parsing attempt
        if (body.trim().startsWith('{')) {
          // Could parse JSON here if needed
        } else {
          // Use body as message if it's not JSON
          final trimmedBody = body.trim();
          if (trimmedBody.length < 200) {
            message = trimmedBody;
          }
        }
      } catch (_) {
        // Ignore parsing errors
      }
    }

    return Failure.network(
      message: message,
      statusCode: statusCode,
      body: body,
    );
  }
}


