import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/app_router/app_router.dart';
import 'package:magic_yeti/player/player.dart';
import 'package:magic_yeti/player_settings.dart';

class CustomizePlayerPage extends StatelessWidget {
  const CustomizePlayerPage({required this.playerNumber, super.key});
  final String playerNumber;

  @override
  Widget build(BuildContext context) {
    final player =
        context.watch<PlayerBloc>().state.playerList[int.parse(playerNumber)];
    final textController = TextEditingController(text: player.name);
    const width = 300.0;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 200,
                    width: width,
                    child: Image.network(
                      player.picture,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: player.color,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SizedBox(
                    width: width,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: textController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: AppSpacing.sm),
                      ElevatedButton(
                        onPressed: () {
                          context.read<PlayerBloc>().add(
                                UpdatePlayerName(
                                  name: textController.text,
                                  playerNumber: player.playerNumber,
                                ),
                              );
                          AppRouter.of(context).goRouter.pop();
                        },
                        child: const Text('ok'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  PlayerSettings(
                    player: player,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
