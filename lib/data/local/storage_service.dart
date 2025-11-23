import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyUserEmail = 'user_email';
  static const String _keyAccessId = 'access_id';
  static const String _keyTemplate = 'template';
  static const String _keySlideCount = 'slide_count';
  static const String _keyLanguage = 'language';
  static const String _keyAiImages = 'ai_images';
  static const String _keyImageForEachSlide = 'image_for_each_slide';
  static const String _keyGoogleImage = 'google_image';
  static const String _keyGoogleText = 'google_text';
  static const String _keyModel = 'model';
  static const String _keyPresentationFor = 'presentation_for';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isLoggedIn => _prefs.getBool(_keyIsLoggedIn) ?? false;
  String? get userEmail => _prefs.getString(_keyUserEmail);
  String? get accessId => _prefs.getString(_keyAccessId);

  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(_keyIsLoggedIn, value);
  }

  Future<void> setUserEmail(String email) async {
    await _prefs.setString(_keyUserEmail, email);
  }

  Future<void> setAccessId(String accessId) async {
    await _prefs.setString(_keyAccessId, accessId);
  }

  // Settings persistence methods
  String? getTemplate() => _prefs.getString(_keyTemplate);
  Future<void> setTemplate(String template) async {
    await _prefs.setString(_keyTemplate, template);
  }

  int? getSlideCount() => _prefs.getInt(_keySlideCount);
  Future<void> setSlideCount(int count) async {
    await _prefs.setInt(_keySlideCount, count);
  }

  String? getLanguage() => _prefs.getString(_keyLanguage);
  Future<void> setLanguage(String language) async {
    await _prefs.setString(_keyLanguage, language);
  }

  bool? getAiImages() => _prefs.getBool(_keyAiImages);
  Future<void> setAiImages(bool value) async {
    await _prefs.setBool(_keyAiImages, value);
  }

  bool? getImageForEachSlide() => _prefs.getBool(_keyImageForEachSlide);
  Future<void> setImageForEachSlide(bool value) async {
    await _prefs.setBool(_keyImageForEachSlide, value);
  }

  bool? getGoogleImage() => _prefs.getBool(_keyGoogleImage);
  Future<void> setGoogleImage(bool value) async {
    await _prefs.setBool(_keyGoogleImage, value);
  }

  bool? getGoogleText() => _prefs.getBool(_keyGoogleText);
  Future<void> setGoogleText(bool value) async {
    await _prefs.setBool(_keyGoogleText, value);
  }

  String? getModel() => _prefs.getString(_keyModel);
  Future<void> setModel(String model) async {
    await _prefs.setString(_keyModel, model);
  }

  String? getPresentationFor() => _prefs.getString(_keyPresentationFor);
  Future<void> setPresentationFor(String value) async {
    await _prefs.setString(_keyPresentationFor, value);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
