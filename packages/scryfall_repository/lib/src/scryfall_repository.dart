import 'package:api_client/api_client.dart';

/// {@template scryfall_repository}
/// Repository for Scryfall API
/// {@endtemplate}
class ScryfallRepository {
  /// {@macro scryfall_repository}
  const ScryfallRepository({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<Card> getCardFullText({required String cardName}) async {
    return _apiClient.getCardFullText(cardName);
  }
}
