import 'package:api_client/api_client.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/app/bloc/app_bloc.dart';
import 'package:magic_yeti/app_router/app_router.dart';
import 'package:magic_yeti/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:scryfall_repository/scryfall_repository.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.apiClient,
    required UserRepository userRepository,
    required ScryfallRepository scryfallRepository,
    required User user,
    super.key,
  })  : _userRepository = userRepository,
        _scryfallRepository = scryfallRepository,
        _user = user;

  final ApiClient apiClient;
  final UserRepository _userRepository;
  final ScryfallRepository _scryfallRepository;
  final User _user;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
        RepositoryProvider.value(value: _scryfallRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              userRepository: _userRepository,
              user: _user,
            ),
          ),
        ],
        child: Provider<AppRouter>(
          create: (context) => AppRouter(
            appStateStream: context.read<AppBloc>().stream,
            initialState: context.read<AppBloc>().state,
          ),
          dispose: (_, appRouter) => appRouter.dispose(),
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter.of(context);

    return MaterialApp.router(
      theme: const AppTheme().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.goRouter,
    );
  }
}

// TODO(jshewmaker): remove this widget once we have HomePage.
class TempWidget extends StatelessWidget {
  const TempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.read<AppBloc>().add(const AppLogoutRequested()),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  AppRouter.of(context).push(const LifeCounterRoute()),
              child: const Text('Table'),
            ),
          ),
        ],
      ),
    );
  }
}
