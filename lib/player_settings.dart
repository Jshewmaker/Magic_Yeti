import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/app_router/app_router.dart';
import 'package:magic_yeti/player_settings/bloc/player_settings_bloc.dart';
import 'package:scryfall_repository/scryfall_repository.dart';

class PlayerSettings extends StatelessWidget {
  const PlayerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerSettingsBloc>(
      create: (_) => PlayerSettingsBloc(
        scryfallRepository: context.read<ScryfallRepository>(),
      ),
      child: const PlayerSettingsView(),
    );
  }
}

class PlayerSettingsView extends StatefulWidget {
  const PlayerSettingsView({super.key});

  @override
  State<PlayerSettingsView> createState() => _PlayerSettingsViewState();
}

class _PlayerSettingsViewState extends State<PlayerSettingsView> {
  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerSettingsBloc, PlayerSettingsState>(
      builder: (context, state) {
        if (state is PlayerSettingsLoading) {
          return Scaffold(
            body: Column(
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
                        child: const Text('Search'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (state is PlayerSettingsLoadSuccess) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textInputAction: TextInputAction.done,
                          onSubmitted: (value) =>
                              context.read<PlayerSettingsBloc>().add(
                                    PlayerSettingsCardRequested(value),
                                  ),
                          controller: textController,
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              context.read<PlayerSettingsBloc>().add(
                                    PlayerSettingsCardRequested(
                                      textController.text,
                                    ),
                                  ),
                          child: const Text('Search'),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.cardList.totalCards,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => AppRouter.of(context).goRouter.pop(
                              state.cardList.data[index].imageUris!.artCrop,
                            ),
                        child: Card(
                          child: Row(
                            children: [
                              if (state.cardList.data[index].imageUris
                                      ?.artCrop ==
                                  null)
                                const Text('No Image')
                              else
                                Image.network(
                                  state.cardList.data[index].imageUris!.artCrop,
                                  scale: 4,
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
        } else {
          return Scaffold(
            body: Column(
              children: [
                Row(
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
                        child: const Text('Search'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

      },
    );
  }
}
