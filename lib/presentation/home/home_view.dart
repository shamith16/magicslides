import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/presentation_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/loading_message_provider.dart';
import '../../core/error_handler.dart';
import '../../data/models/presentation_request.dart';
import '../../data/models/watermark.dart';
import '../../utils/template_mapper.dart';
import '../result/result_view.dart';
import '../auth/login_view.dart';
import 'widgets/topic_input_field.dart';
import 'widgets/template_selector.dart';
import 'widgets/advanced_settings_section.dart';
import 'widgets/generate_button.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final _topicController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  // Watermark controllers
  final _watermarkWidthController = TextEditingController();
  final _watermarkHeightController = TextEditingController();
  final _watermarkUrlController = TextEditingController();

  // Form State - defaults aligned with PresentationRequest model
  String _templateType = 'default';
  String _selectedTemplate = TemplateMapper.fallbackForType('default');
  int _slideCount = 10;
  String _language = 'en';
  bool _aiImages = true;
  bool _imageForEachSlide = true;
  bool _googleImage = false; // Fixed: matches model default
  bool _googleText = false; // Fixed: matches model default
  String _model = 'gpt-4';
  String _presentationFor = 'student';
  
  // Watermark state
  bool _enableWatermark = false;
  String _watermarkPosition = 'bottom-right';

  @override
  void initState() {
    super.initState();
    _loadSavedSettings();
    // Listen for presentation errors and show toast
    ref.listenManual(presentationProvider, (previous, next) {
      if (next.hasError && next.error != previous?.error) {
        showErrorToast(next.error);
        ref.read(loadingMessageProvider.notifier).stop();
      } else if (next.hasValue && 
                  next.value != null && 
                  previous?.isLoading == true) {
        ref.read(loadingMessageProvider.notifier).stop();
        // Success - navigate to result view
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResultView(response: next.value!),
            ),
          );
        }
      }
    });
  }

  Future<void> _loadSavedSettings() async {
    final storage = ref.read(storageServiceProvider);
    
    setState(() {
      final savedTemplate = storage.getTemplate();
      if (savedTemplate != null) {
        if (TemplateMapper.isValidTemplate(savedTemplate)) {
          _selectedTemplate = savedTemplate;
          _templateType = TemplateMapper.inferTypeFromTemplate(savedTemplate);
        } else if (savedTemplate == 'editable' || savedTemplate == 'default') {
          _templateType = savedTemplate;
          _selectedTemplate = TemplateMapper.fallbackForType(_templateType);
        } else {
          _selectedTemplate = TemplateMapper.fallbackForType(_templateType);
        }
      } else {
        _selectedTemplate = TemplateMapper.fallbackForType(_templateType);
      }
      _slideCount = storage.getSlideCount() ?? 10;
      _language = storage.getLanguage() ?? 'en';
      _aiImages = storage.getAiImages() ?? true;
      _imageForEachSlide = storage.getImageForEachSlide() ?? true;
      _googleImage = storage.getGoogleImage() ?? false;
      _googleText = storage.getGoogleText() ?? false;
      _model = storage.getModel() ?? 'gpt-4';
      _presentationFor = storage.getPresentationFor() ?? 'student';
    });
  }

  Future<void> _saveSettings() async {
    final storage = ref.read(storageServiceProvider);
    await Future.wait([
      storage.setTemplate(_selectedTemplate),
      storage.setSlideCount(_slideCount),
      storage.setLanguage(_language),
      storage.setAiImages(_aiImages),
      storage.setImageForEachSlide(_imageForEachSlide),
      storage.setGoogleImage(_googleImage),
      storage.setGoogleText(_googleText),
      storage.setModel(_model),
      storage.setPresentationFor(_presentationFor),
    ]);
  }

  @override
  void dispose() {
    _topicController.dispose();
    _watermarkWidthController.dispose();
    _watermarkHeightController.dispose();
    _watermarkUrlController.dispose();
    super.dispose();
  }

  Future<void> _generate() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Always use default API credentials for API calls
    const apiEmail = 'abhi.shamith506@gmail.com';
    const apiAccessId = '5273a113-e3a1-4545-9bbb-e642b7d0fb17';

    // Validate template
    if (!TemplateMapper.isValidTemplate(_selectedTemplate)) {
      showWarningToast('Please select a valid template type.');
      return;
    }

    // Build watermark if enabled
    Watermark? watermark;
    if (_enableWatermark) {
      if (_watermarkWidthController.text.isEmpty ||
          _watermarkHeightController.text.isEmpty ||
          _watermarkUrlController.text.isEmpty) {
        showWarningToast(
          'Please fill all watermark fields or disable watermark.',
        );
        return;
      }
      watermark = Watermark(
        width: _watermarkWidthController.text.trim(),
        height: _watermarkHeightController.text.trim(),
        brandURL: _watermarkUrlController.text.trim(),
        position: _watermarkPosition,
      );
    }

    // Save settings before generating
    await _saveSettings();

    final request = PresentationRequest(
      topic: _topicController.text.trim(),
      email: apiEmail, // Use API email for all API calls
      accessId: apiAccessId, // Use API accessId for all API calls
      template: _selectedTemplate,
      slideCount: _slideCount,
      language: _language,
      aiImages: _aiImages,
      imageForEachSlide: _imageForEachSlide,
      googleImage: _googleImage,
      googleText: _googleText,
      model: _model,
      presentationFor: _presentationFor,
      watermark: watermark,
    );

    ref
        .read(loadingMessageProvider.notifier)
        .start(slideCount: _slideCount, topic: _topicController.text);

    await ref
        .read(presentationProvider.notifier)
        .generatePresentation(request);
  }

  Future<void> _logout() async {
    await ref.read(authProvider.notifier).logout();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final presentationState = ref.watch(presentationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MagicSlides Generator'),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TopicInputField(controller: _topicController),
              const SizedBox(height: 16),
              TemplateSelector(
                templateType: _templateType,
                onTemplateTypeChanged: (value) {
                  setState(() {
                    _templateType = value;
                    _selectedTemplate =
                        TemplateMapper.fallbackForType(_templateType);
                  });
                },
                selectedTemplate: _selectedTemplate,
                templateOptions: TemplateMapper.templatesForType(_templateType),
                onTemplateChanged: (value) =>
                    setState(() => _selectedTemplate = value),
              ),
              const SizedBox(height: 8),
              AdvancedSettingsSection(
                slideCount: _slideCount,
                language: _language,
                aiImages: _aiImages,
                imageForEachSlide: _imageForEachSlide,
                googleImage: _googleImage,
                googleText: _googleText,
                model: _model,
                presentationFor: _presentationFor,
                enableWatermark: _enableWatermark,
                watermarkPosition: _watermarkPosition,
                watermarkWidthController: _watermarkWidthController,
                watermarkHeightController: _watermarkHeightController,
                watermarkUrlController: _watermarkUrlController,
                onSlideCountChanged: (val) => setState(() => _slideCount = val),
                onLanguageChanged: (val) => setState(() => _language = val),
                onAiImagesChanged: (val) => setState(() => _aiImages = val),
                onImageForEachSlideChanged: (val) =>
                    setState(() => _imageForEachSlide = val),
                onGoogleImageChanged: (val) => setState(() => _googleImage = val),
                onGoogleTextChanged: (val) => setState(() => _googleText = val),
                onModelChanged: (val) => setState(() => _model = val),
                onPresentationForChanged: (val) =>
                    setState(() => _presentationFor = val),
                onEnableWatermarkChanged: (val) =>
                    setState(() => _enableWatermark = val),
                onWatermarkPositionChanged: (val) =>
                    setState(() => _watermarkPosition = val),
              ),
              const SizedBox(height: 24),
              GenerateButton(
                isLoading: presentationState.isLoading,
                onPressed: _generate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
