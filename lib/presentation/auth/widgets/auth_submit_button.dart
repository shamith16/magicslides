import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthSubmitButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  const AuthSubmitButton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  });

  bool get _isIOS => Platform.isIOS;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (_isIOS) {
      // iOS-style button
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          color: colorScheme.primary,
          disabledColor: colorScheme.primary.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
          padding: const EdgeInsets.symmetric(vertical: 14),
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? CupertinoActivityIndicator(
                  radius: 10.0,
                  color: colorScheme.onPrimary,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimary,
                  ),
                ),
        ),
      );
    } else {
      // Android-style button
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.onPrimary,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      );
    }
  }
}
