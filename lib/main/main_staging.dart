import 'package:firebase_authentication_client/firebase_authentication_client.dart';
import 'package:magic_yeti/app/app.dart';
import 'package:magic_yeti/main/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  bootstrap(() async {
    final userRepository =
        UserRepository(authenticationClient: FirebaseAuthenticationClient());
    return App(
      userRepository: userRepository,
      user: await userRepository.user.first,
    );
  });
}
