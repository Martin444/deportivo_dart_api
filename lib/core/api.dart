class API {
  static late API _instance;

  static bool _inicialized = false;
  static String _baseURL = '';
  static String _accessToken = '';
  static String? _googleKEY = '';

  API._();

  static API getInstance(
    String urlMenuapi, {
    String? googleApiKey,
  }) {
    if (urlMenuapi.isNotEmpty) {
      _instance = API._();
      _baseURL = urlMenuapi;
      _inicialized = true;
      _googleKEY = googleApiKey;
    }
    return _instance;
  }

  static String setAccessToken(String access) {
    _accessToken = access;
    return _accessToken;
  }

  static String get defaulBaseUrl => _baseURL;
  static String get loginAccessToken => _accessToken;
  static String? get googleAPIKEY => _googleKEY;

  bool get initialized => _inicialized;
}
