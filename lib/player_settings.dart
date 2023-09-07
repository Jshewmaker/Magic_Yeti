import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final textController = TextEditingController(text: 'text');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerSettingsBloc, PlayerSettingsState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: TextField(
              controller: textController,
              onTapOutside: (_) => context
                  .read<PlayerSettingsBloc>()
                  .add(PlayerSettingsCardRequested(textController.text)),
            ),
          ),
        );
      },
    );
  }
}
