import 'package:http/http.dart' as http;

/// {@template api_client}
/// API client for Magic Yeti app.
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = Uri.parse(baseUrl),
        _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final Uri _baseUrl;

  Future<>
}
