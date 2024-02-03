import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_yeti/app/bloc/app_bloc.dart';
import 'package:magic_yeti/app_router/redirects.dart';
import 'package:magic_yeti/app_router/routes.dart';
import 'package:provider/provider.dart';

export 'routes.dart';

class AppRouter {
  AppRouter({
    required Stream<AppState> appStateStream,
    required AppState initialState,
    GoRouter? goRouter,
  }) : _status = initialState.status {
    _goRouter = goRouter ??
        GoRouter(
          routes: appRoutes,
          debugLogDiagnostics: kDebugMode,
          redirect: (context, state) => redirects(
            context: context,
            location: state.uri.toString(),
            status: _status,
          ),
        );

    _appStateSubscription = appStateStream.listen(
      (appState) {
        _status = appState.status;

        _goRouter.refresh();
      },
    );
  }

  late final GoRouter _goRouter;
  late AppStatus _status;
  late final StreamSubscription<AppState> _appStateSubscription;

  /// Pushes an [AppRoute] route on top of the current navigation stack.
  ///
  /// Example routes:
  /// * [HomeRoute]
  /// * [LoginRoute]
  void push(AppRoute appRoute) {
    final path = appRoute.path;
    final data = appRoute.extra;

    _goRouter.push(
      path,
      extra: data,
    );
  }

  /// Pushes an [AppRoute] route on top of the current navigation stack.
  ///
  /// Example routes:
  /// * [HomeRoute]
  /// * [LoginRoute]
  void pushFromPath(String path, {Object? extra}) {
    _goRouter.push(
      path,
      extra: extra,
    );
  }

  /// Pop the top page off the GoRouter's page stack.
  void pop(dynamic value) => _goRouter.pop(value);

  /// Expose the [GoRouter]
  GoRouter get goRouter => _goRouter;

  static AppRouter of(BuildContext context) => context.read<AppRouter>();

  void dispose() {
    _appStateSubscription.cancel();
  }
}
