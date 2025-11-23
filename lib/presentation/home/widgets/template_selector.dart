import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TemplateSelector extends StatelessWidget {
  static final Uri _docsUri = Uri.parse(
    'https://www.magicslides.app/docs-api/topic',
  );

  final String templateType;
  final ValueChanged<String> onTemplateTypeChanged;
  final String selectedTemplate;
  final List<String> templateOptions;
  final ValueChanged<String> onTemplateChanged;

  const TemplateSelector({
    super.key,
    required this.templateType,
    required this.onTemplateTypeChanged,
    required this.selectedTemplate,
    required this.templateOptions,
    required this.onTemplateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Template Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'default', label: Text('Default')),
            ButtonSegment(value: 'editable', label: Text('Editable')),
          ],
          selected: {templateType},
          onSelectionChanged: (selection) {
            if (selection.isNotEmpty) {
              onTemplateTypeChanged(selection.first);
            }
          },
        ),
        const SizedBox(height: 8),
        Text(
          '${templateType == 'editable' ? 'Editable' : 'Default'} Templates',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 12,
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              initialValue: selectedTemplate,
              isExpanded: true,
              isDense: true,
              menuMaxHeight: 320,
              borderRadius: BorderRadius.circular(20),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              items: templateOptions
                  .map(
                    (template) => DropdownMenuItem<String>(
                      value: template,
                      child: Text(template),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) onTemplateChanged(value);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black54),
            children: [
              const TextSpan(
                text:
                    'Template availability changes with each type. Review the full catalog in the ',
              ),
              TextSpan(
                text: 'Supported Templates docs.',
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (!await launchUrl(
                      _docsUri,
                      mode: LaunchMode.externalApplication,
                    )) {}
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
