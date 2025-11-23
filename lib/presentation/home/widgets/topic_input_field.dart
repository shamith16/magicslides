import 'package:flutter/material.dart';

class TopicInputField extends StatelessWidget {
  final TextEditingController controller;

  const TopicInputField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Topic *',
        hintText: 'Enter presentation topic',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a topic';
        }
        if (value.trim().length < 3) {
          return 'Topic must be at least 3 characters';
        }
        return null;
      },
      textCapitalization: TextCapitalization.sentences,
    );
  }
}

