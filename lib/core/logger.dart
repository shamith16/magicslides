import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'failure.dart';

/// Centralized logging service
class Logger {
  static const String _tag = 'MagicSlides';

  /// Log debug message
  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      developer.log(
        message,
        name: _tag,
        error: error,
        stackTrace: stackTrace,
        level: 800, // Debug level
      );
    }
  }

  /// Log info message
  static void info(String message) {
    if (kDebugMode) {
      developer.log(
        message,
        name: _tag,
        level: 700, // Info level
      );
    }
  }

  /// Log warning message
  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    developer.log(
      message,
      name: _tag,
      error: error,
      stackTrace: stackTrace,
      level: 900, // Warning level
    );
  }

  /// Log error message
  static void error(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    developer.log(
      message,
      name: _tag,
      error: error,
      stackTrace: stackTrace,
      level: 1000, // Error level
    );
  }

  /// Log failure
  static void logFailure(Failure failure, [StackTrace? stackTrace]) {
    switch (failure) {
      case NetworkFailure(:final message, :final statusCode, :final body):
        error(
          'Network failure: $message',
          'Status: $statusCode, Body: $body',
          stackTrace,
        );
      case AuthFailure(:final message):
        warning('Auth failure: $message', null, stackTrace);
      case ValidationFailure(:final message):
        warning('Validation failure: $message', null, stackTrace);
      case UnexpectedFailure(:final message, :final originalError):
        error(
          'Unexpected failure: $message',
          originalError,
          stackTrace,
        );
    }
  }
}


