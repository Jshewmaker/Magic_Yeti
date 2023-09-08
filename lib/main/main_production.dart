import 'package:api_client/api_client.dart';
import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:magic_yeti/app/app.dart';
import 'package:magic_yeti/main/bootstrap.dart';
import 'package:scryfall_repository/scryfall_repository.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  await bootstrap(() async {
    final apiClient = ApiClient(
      baseUrl: 'https://api.scryfall.com',
    );
    final userRepository =
        UserRepository(authenticationClient: FirebaseAuthenticationClient());

    final scryfallRepository = ScryfallRepository(apiClient: apiClient);
    return App(
      apiClient: apiClient,
      scryfallRepository: scryfallRepository,
      userRepository: userRepository,
      user: await userRepository.user.first,
    );
  });
}
