part of 'player_settings_bloc.dart';

sealed class PlayerSettingsState extends Equatable {
  const PlayerSettingsState();

  @override
  List<Object> get props => [];
}

final class PlayerSettingsInitial extends PlayerSettingsState {}

// final class PlayerSettingsRequested extends PlayerSettingsState {
//   const PlayerSettingsRequested(this.cardName);

//   final String cardName;
// }

final class PlayerSettingsLoadSuccess extends PlayerSettingsState {
  const PlayerSettingsLoadSuccess(this.cardList);

  final Card cardList;
}

final class PlayerSettingsLoadFailure extends PlayerSettingsState {}
