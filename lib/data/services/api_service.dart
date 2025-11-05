import 'package:http/http.dart' as http;

import 'package:nyayanow/core/config/app_config.dart';

class ApiService {
  final http.Client _client;
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> get(String path) {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}$path');
    return _client.get(uri);
  }
}

