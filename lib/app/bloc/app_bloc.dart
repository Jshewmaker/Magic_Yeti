import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required UserRepository userRepository,
    required User user,
  })  : _userRepository = userRepository,
        super(
          user == User.unauthenticated
              ? const AppState.unauthenticated()
              : AppState.authenticated(user),
        ) {
    on<_AppUserChanged>(_appUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _userRepository.user.listen(_userChanged);
  }

  final UserRepository _userRepository;
  late final StreamSubscription<User> _userSubscription;
  void _userChanged(User user) => add(_AppUserChanged(user));

  void _appUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    event.user == User.unauthenticated
        ? emit(const AppState.unauthenticated())
        : emit(AppState.authenticated(event.user));
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_userRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
