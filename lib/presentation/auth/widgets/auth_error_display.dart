import 'package:flutter/material.dart';

class AuthErrorDisplay extends StatelessWidget {
  final String? error;

  const AuthErrorDisplay({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final errorColor = theme.colorScheme.error;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        error!,
        style: TextStyle(color: errorColor),
      ),
    );
  }
}
