import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_yeti/home/home_page.dart';
import 'package:magic_yeti/life_counter/view/life_counter_page.dart';
import 'package:magic_yeti/login/login.dart';
import 'package:magic_yeti/player/view/customize_player_page.dart';
import 'package:magic_yeti/sign_up/sign_up.dart';

final appRoutes = [
  LoginRoute.route,
  SignUpRoute.route,
  HomeRoute.route,
  LifeCounterRoute.route,
];

abstract class AppRoute extends Equatable {
  const AppRoute();

  Object? get extra => null;

  String get path;

  @override
  List<Object?> get props => [path, extra];
}

class LoginRoute extends AppRoute {
  const LoginRoute() : super();

  @override
  String get path => '/login';

  static GoRoute get route => GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginPage();
        },
      );
}

class SignUpRoute extends AppRoute {
  const SignUpRoute() : super();

  @override
  String get path => '/sign_up';

  static GoRoute get route => GoRoute(
        path: '/sign_up',
        builder: (context, state) {
          return const SignUpPage();
        },
      );
}

class LifeCounterRoute extends AppRoute {
  const LifeCounterRoute() : super();

  @override
  String get path => '/life_counter';

  static GoRoute get route => GoRoute(
        path: '/life_counter',
        builder: (context, state) {
          return const LifeCounterPage();
        },
        routes: [
          CustomizePlayerRoute.route,
        ],
      );
}

class HomeRoute extends AppRoute {
  const HomeRoute() : super();

  @override
  String get path => '/';

  static GoRoute get route => GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      );
}

class CustomizePlayerRoute extends AppRoute {
  const CustomizePlayerRoute() : super();

  @override
  String get path => 'customize_player/:player';

  String get name => 'customizePlayer';

  static GoRoute get route => GoRoute(
        name: 'customizePlayer',
        path: 'customize_player/:player',
        builder: (context, state) {
          return CustomizePlayerPage(
            playerNumber: state.pathParameters['player']!,
          );
        },
      );
}
