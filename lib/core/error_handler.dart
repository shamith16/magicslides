import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'failure.dart';
import 'logger.dart';

/// Global error handler for uncaught errors
class GlobalErrorHandler {
  static void initialize() {
    // Handle Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      Logger.error(
        'Flutter framework error',
        details.exception,
        details.stack,
      );
    };

    // Handle async errors
    PlatformDispatcher.instance.onError = (error, stack) {
      Logger.error('Uncaught async error', error, stack);
      return true; // Handled
    };
  }
}

/// Global toast notification functions (no context required)

/// Shows a toast notification for a failure
void showFailureToast(Failure failure) {
  final message = failure.userMessage;
  
  toastification.show(
    title: Text(_getFailureTitle(failure)),
    description: Text(message),
    type: _getFailureToastType(failure),
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 5),
    showProgressBar: false,
  );
  Logger.logFailure(failure);
}

String _getFailureTitle(Failure failure) => switch (failure) {
      NetworkFailure() => 'Network Error',
      AuthFailure() => 'Authentication Error',
      ValidationFailure() => 'Validation Error',
      UnexpectedFailure() => 'Error',
    };

ToastificationType _getFailureToastType(Failure failure) => switch (failure) {
      NetworkFailure() => ToastificationType.error,
      AuthFailure() => ToastificationType.error,
      ValidationFailure() => ToastificationType.warning,
      UnexpectedFailure() => ToastificationType.error,
    };

/// Helper to show error toast from AsyncValue error
void showErrorToast(Object? error) {
  final failure = error is Failure
      ? error
      : Failure.fromException(error ?? 'Unknown error');
  
  showFailureToast(failure);
}

/// Shows a success toast notification
void showSuccessToast(String message, {String? title}) {
  toastification.show(
    title: Text(title ?? 'Success'),
    description: Text(message),
    type: ToastificationType.success,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 3),
    showProgressBar: false,
  );
}

/// Shows an info toast notification
void showInfoToast(String message, {String? title}) {
  toastification.show(
    title: Text(title ?? 'Info'),
    description: Text(message),
    type: ToastificationType.info,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 3),
    showProgressBar: false,
  );
}

/// Shows a warning toast notification
void showWarningToast(String message, {String? title}) {
  toastification.show(
    title: Text(title ?? 'Warning'),
    description: Text(message),
    type: ToastificationType.warning,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 4),
    showProgressBar: false,
  );
}


