import 'dart:convert';

import 'package:api_client/src/models/models.dart';
import 'package:http/http.dart' as http;

/// {@template ApiClientError}
/// Failure thrown when getClassification endpoint fails.
///
/// {@endtemplate}
class ApiClientError implements Exception {
  ///{@macro ApiClientError}
  ApiClientError({required this.error, required this.stackTrace});

  /// Error thrown
  final dynamic error;

  /// Stacktrace when error was thrown
  final StackTrace stackTrace;

  @override
  String toString() {
    return error.toString();
  }
}

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

  Future<Card> getCardFullText(String cardName) async {
    final queryParameters = {
      'fuzzy': 'craterhoof',
    };
    final request = _baseUrl.replace(
      path: '/cards/named',
      queryParameters: queryParameters,
    );

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode != 200) {
        throw ApiClientError(
          error: '${response.statusCode}',
          stackTrace: StackTrace.current,
        );
      }
      final json = jsonDecode(response.body);
      return Card.fromJson(json as Map<String, dynamic>);
    } catch (error, stackTrace) {
      throw ApiClientError(error: error, stackTrace: stackTrace);
    }
  }
}
