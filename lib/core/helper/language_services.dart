// language_service.dart
class LanguageService {
  static final LanguageService _instance = LanguageService._internal();

  String _languageCode = 'en'; // Default language code

  LanguageService._internal();

  static LanguageService get instance => _instance;

  String get languageCode => _languageCode;

  set languageCode(String code) {
    _languageCode = code;
  }
}
