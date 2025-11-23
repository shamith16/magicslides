import 'package:flutter/material.dart';

class ContentSettingsSection extends StatelessWidget {
  final bool googleText;
  final String model;
  final String presentationFor;
  final ValueChanged<bool> onGoogleTextChanged;
  final ValueChanged<String> onModelChanged;
  final ValueChanged<String> onPresentationForChanged;

  const ContentSettingsSection({
    super.key,
    required this.googleText,
    required this.model,
    required this.presentationFor,
    required this.onGoogleTextChanged,
    required this.onModelChanged,
    required this.onPresentationForChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Content Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SwitchListTile(
          title: const Text('Google Text'),
          subtitle: const Text('Enhance text with Google search'),
          value: googleText,
          onChanged: onGoogleTextChanged,
        ),
        ListTile(
          title: const Text('AI Model'),
          trailing: SizedBox(
            width: 120,
            child: DropdownButtonFormField<String>(
              initialValue: model,
              isDense: true,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'gpt-4',
                  child: Text('GPT-4'),
                ),
                DropdownMenuItem(
                  value: 'gpt-3.5',
                  child: Text('GPT-3.5'),
                ),
              ],
              onChanged: (val) {
                if (val != null) {
                  onModelChanged(val);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Presentation For'),
          trailing: SizedBox(
            width: 140,
            child: DropdownButtonFormField<String>(
              initialValue: presentationFor,
              isDense: true,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'student',
                  child: Text('Student'),
                ),
                DropdownMenuItem(
                  value: 'teacher',
                  child: Text('Teacher'),
                ),
                DropdownMenuItem(
                  value: 'business',
                  child: Text('Business'),
                ),
                DropdownMenuItem(
                  value: 'professional',
                  child: Text('Professional'),
                ),
              ],
              onChanged: (val) {
                if (val != null) {
                  onPresentationForChanged(val);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

