import 'package:flutter/material.dart';

class WatermarkSettingsSection extends StatelessWidget {
  final bool enableWatermark;
  final String watermarkPosition;
  final TextEditingController widthController;
  final TextEditingController heightController;
  final TextEditingController urlController;
  final ValueChanged<bool> onEnableWatermarkChanged;
  final ValueChanged<String> onWatermarkPositionChanged;

  const WatermarkSettingsSection({
    super.key,
    required this.enableWatermark,
    required this.watermarkPosition,
    required this.widthController,
    required this.heightController,
    required this.urlController,
    required this.onEnableWatermarkChanged,
    required this.onWatermarkPositionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Watermark Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SwitchListTile(
          title: const Text('Enable Watermark'),
          subtitle: const Text('Add watermark to presentation'),
          value: enableWatermark,
          onChanged: onEnableWatermarkChanged,
        ),
        if (enableWatermark) ...[
          TextFormField(
            controller: widthController,
            decoration: const InputDecoration(
              labelText: 'Watermark Width *',
              hintText: 'e.g., 100px or 20%',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (enableWatermark && (value == null || value.isEmpty)) {
                return 'Please enter watermark width';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: heightController,
            decoration: const InputDecoration(
              labelText: 'Watermark Height *',
              hintText: 'e.g., 50px or 10%',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (enableWatermark && (value == null || value.isEmpty)) {
                return 'Please enter watermark height';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: urlController,
            decoration: const InputDecoration(
              labelText: 'Brand URL *',
              hintText: 'https://example.com/logo.png',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (enableWatermark && (value == null || value.isEmpty)) {
                return 'Please enter brand URL';
              }
              if (enableWatermark && value != null) {
                final uri = Uri.tryParse(value);
                if (uri == null || !uri.hasScheme) {
                  return 'Please enter a valid URL';
                }
              }
              return null;
            },
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 8),
          ListTile(
            title: const Text('Watermark Position'),
            trailing: SizedBox(
              width: 140,
              child: DropdownButtonFormField<String>(
                initialValue: watermarkPosition,
                isDense: true,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'top-left',
                    child: Text('Top Left'),
                  ),
                  DropdownMenuItem(
                    value: 'top-right',
                    child: Text('Top Right'),
                  ),
                  DropdownMenuItem(
                    value: 'bottom-left',
                    child: Text('Bottom Left'),
                  ),
                  DropdownMenuItem(
                    value: 'bottom-right',
                    child: Text('Bottom Right'),
                  ),
                  DropdownMenuItem(
                    value: 'center',
                    child: Text('Center'),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    onWatermarkPositionChanged(val);
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
      ],
    );
  }
}

