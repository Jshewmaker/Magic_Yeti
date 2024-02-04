import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/l10n/l10n.dart';
import 'package:magic_yeti/player/player.dart';
import 'package:magic_yeti/player_settings/bloc/player_settings_bloc.dart';
import 'package:scryfall_repository/scryfall_repository.dart';

class SelectCommanderWidget extends StatelessWidget {
  const SelectCommanderWidget({required this.player, super.key});
  final Player player;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerSettingsBloc>(
      create: (_) => PlayerSettingsBloc(
        scryfallRepository: context.read<ScryfallRepository>(),
      ),
      child: PlayerSettingsView(
        player: player,
      ),
    );
  }
}

class PlayerSettingsView extends StatefulWidget {
  const PlayerSettingsView({required this.player, super.key});
  final Player player;
  @override
  State<PlayerSettingsView> createState() => _PlayerSettingsViewState();
}

class _PlayerSettingsViewState extends State<PlayerSettingsView> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<PlayerSettingsBloc, PlayerSettingsState>(
      builder: (context, state) {
        if (state is PlayerSettingsLoading) {
          return Column(
            children: [
              Column(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.read<PlayerSettingsBloc>().add(
                            PlayerSettingsCardRequested(
                              textController.text,
                            ),
                          ),
                      child: Text(l10n.searchButtonText),
                    ),
                  ),
                  const LinearProgressIndicator()
                ],
              ),
            ],
          );
        }
        if (state is PlayerSettingsLoadSuccess) {
          return Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: textController,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => context.read<PlayerSettingsBloc>().add(
                              PlayerSettingsCardRequested(
                                textController.text,
                              ),
                            ),
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cardList.totalCards,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => context.read<PlayerBloc>().add(
                              UpdateCommanderEvent(
                                pictureUrl: state
                                    .cardList.data[index].imageUris!.artCrop,
                                playerNumber: widget.player.playerNumber,
                              ),
                            ),
                        child: Card(
                          child: Row(
                            children: [
                              Image.network(
                                state.cardList.data[index].imageUris!.artCrop,
                                scale: 4,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(),
                              ),
                              Text(
                                state.cardList.data[index].name,
                                style: const TextStyle(fontSize: 36),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: textController,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.read<PlayerSettingsBloc>().add(
                    PlayerSettingsCardRequested(
                      textController.text,
                    ),
                  ),
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }
}
