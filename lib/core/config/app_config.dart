class AppConfig {
  static const apiBaseUrl =
      String.fromEnvironment('API_URL', defaultValue: 'https://api.nyayanow.org');
  static const aiBaseUrl =
      String.fromEnvironment('AI_URL', defaultValue: 'https://ai.nyayanow.org');
  static const appVersion = '1.0.0';
}
