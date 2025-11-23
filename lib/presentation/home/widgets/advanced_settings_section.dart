import 'package:flutter/material.dart';
import 'image_settings_section.dart';
import 'content_settings_section.dart';
import 'watermark_settings_section.dart';

class AdvancedSettingsSection extends StatelessWidget {
  final int slideCount;
  final String language;
  final bool aiImages;
  final bool imageForEachSlide;
  final bool googleImage;
  final bool googleText;
  final String model;
  final String presentationFor;
  final bool enableWatermark;
  final String watermarkPosition;
  final TextEditingController watermarkWidthController;
  final TextEditingController watermarkHeightController;
  final TextEditingController watermarkUrlController;
  final ValueChanged<int> onSlideCountChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<bool> onAiImagesChanged;
  final ValueChanged<bool> onImageForEachSlideChanged;
  final ValueChanged<bool> onGoogleImageChanged;
  final ValueChanged<bool> onGoogleTextChanged;
  final ValueChanged<String> onModelChanged;
  final ValueChanged<String> onPresentationForChanged;
  final ValueChanged<bool> onEnableWatermarkChanged;
  final ValueChanged<String> onWatermarkPositionChanged;

  const AdvancedSettingsSection({
    super.key,
    required this.slideCount,
    required this.language,
    required this.aiImages,
    required this.imageForEachSlide,
    required this.googleImage,
    required this.googleText,
    required this.model,
    required this.presentationFor,
    required this.enableWatermark,
    required this.watermarkPosition,
    required this.watermarkWidthController,
    required this.watermarkHeightController,
    required this.watermarkUrlController,
    required this.onSlideCountChanged,
    required this.onLanguageChanged,
    required this.onAiImagesChanged,
    required this.onImageForEachSlideChanged,
    required this.onGoogleImageChanged,
    required this.onGoogleTextChanged,
    required this.onModelChanged,
    required this.onPresentationForChanged,
    required this.onEnableWatermarkChanged,
    required this.onWatermarkPositionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Presentation Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _SettingsCard(
                title: 'Slide Count',
                child: DropdownButtonFormField<int>(
                  initialValue: slideCount,
                  isDense: true,
                  isExpanded: true,
                  items: List.generate(50, (index) => index + 1)
                      .map(
                        (e) => DropdownMenuItem(value: e, child: Text('$e')),
                      )
                      .toList(),
                  onChanged: (val) {
                    if (val != null) onSlideCountChanged(val);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SettingsCard(
                title: 'Language',
                child: DropdownButtonFormField<String>(
                  initialValue: language,
                  isDense: true,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('English')),
                    DropdownMenuItem(value: 'es', child: Text('Spanish')),
                    DropdownMenuItem(value: 'fr', child: Text('French')),
                    DropdownMenuItem(value: 'de', child: Text('German')),
                    DropdownMenuItem(value: 'it', child: Text('Italian')),
                    DropdownMenuItem(value: 'pt', child: Text('Portuguese')),
                    DropdownMenuItem(value: 'ru', child: Text('Russian')),
                    DropdownMenuItem(value: 'zh', child: Text('Chinese')),
                    DropdownMenuItem(value: 'ja', child: Text('Japanese')),
                  ],
                  onChanged: (val) {
                    if (val != null) onLanguageChanged(val);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ImageSettingsSection(
          aiImages: aiImages,
          imageForEachSlide: imageForEachSlide,
          googleImage: googleImage,
          onAiImagesChanged: onAiImagesChanged,
          onImageForEachSlideChanged: onImageForEachSlideChanged,
          onGoogleImageChanged: onGoogleImageChanged,
        ),
        const SizedBox(height: 16),
        ContentSettingsSection(
          googleText: googleText,
          model: model,
          presentationFor: presentationFor,
          onGoogleTextChanged: onGoogleTextChanged,
          onModelChanged: onModelChanged,
          onPresentationForChanged: onPresentationForChanged,
        ),
        const SizedBox(height: 16),
        WatermarkSettingsSection(
          enableWatermark: enableWatermark,
          watermarkPosition: watermarkPosition,
          widthController: watermarkWidthController,
          heightController: watermarkHeightController,
          urlController: watermarkUrlController,
          onEnableWatermarkChanged: onEnableWatermarkChanged,
          onWatermarkPositionChanged: onWatermarkPositionChanged,
        ),
      ],
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SettingsCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

