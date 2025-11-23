import 'package:flutter/material.dart';

class ImageSettingsSection extends StatelessWidget {
  final bool aiImages;
  final bool imageForEachSlide;
  final bool googleImage;
  final ValueChanged<bool> onAiImagesChanged;
  final ValueChanged<bool> onImageForEachSlideChanged;
  final ValueChanged<bool> onGoogleImageChanged;

  const ImageSettingsSection({
    super.key,
    required this.aiImages,
    required this.imageForEachSlide,
    required this.googleImage,
    required this.onAiImagesChanged,
    required this.onImageForEachSlideChanged,
    required this.onGoogleImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Image Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SwitchListTile(
          title: const Text('AI Images'),
          subtitle: const Text('Generate images using AI'),
          value: aiImages,
          onChanged: onAiImagesChanged,
        ),
        SwitchListTile(
          title: const Text('Image on Each Slide'),
          subtitle: const Text('Add image to every slide'),
          value: imageForEachSlide,
          onChanged: onImageForEachSlideChanged,
        ),
        SwitchListTile(
          title: const Text('Google Images'),
          subtitle: const Text('Use Google image search'),
          value: googleImage,
          onChanged: onGoogleImageChanged,
        ),
      ],
    );
  }
}

