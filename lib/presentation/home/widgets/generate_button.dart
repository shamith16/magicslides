import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const GenerateButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        isLoading ? 'Generating presentation…' : 'Generate Presentation',
      ),
    );
  }
}

