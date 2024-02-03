part of 'player_bloc.dart';

sealed class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class CreatePlayerEvent extends PlayerEvent {
  const CreatePlayerEvent({required this.numberOfPlayers});

  final int numberOfPlayers;
}

class UpdateCommanderEvent extends PlayerEvent {
  const UpdateCommanderEvent({
    required this.pictureUrl,
    required this.playerNumber,
  });

  final String pictureUrl;
  final int playerNumber;
}

class UpdatePlayerName extends PlayerEvent {
  const UpdatePlayerName({required this.playerNumber, required this.name});
  final int playerNumber;
  final String name;
}
