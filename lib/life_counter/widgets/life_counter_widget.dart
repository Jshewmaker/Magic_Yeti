import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_yeti/app_router/app_router.dart';
import 'package:magic_yeti/life_counter/bloc/life_counter_bloc.dart';
import 'package:magic_yeti/player/player.dart';

// class LifeCounterWidget extends StatefulWidget {
//   const LifeCounterWidget({
//     required this.player,
//     super.key,
//   });

//   final Player player;

//   @override
//   State<LifeCounterWidget> createState() => _LifeCounterWidgetState();
// }

class LifeCounterWidget extends StatelessWidget {
  LifeCounterWidget({
    required this.player,
    super.key,
  });
  final Player player;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    textController.text = player.name;
    return RotatedBox(
      quarterTurns: player.playerNumber < 2 ? 0 : 2,
      child: Container(
        decoration: _getDecoration(),
        child: BlocProvider(
          create: (context) => LifeCounterBloc(startingLife: player.lifePoints),
          child: BlocBuilder<LifeCounterBloc, LifeCounterState>(
            builder: (context, state) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      player.picture,
                      errorBuilder: (context, error, stackTrace) => Container(
                        decoration: BoxDecoration(
                            color: player.color,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${state.counter}',
                      style: const TextStyle(fontSize: 48),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        key: const ValueKey(
                          'life_counter_widget_decrement',
                        ),
                        child: GestureDetector(
                          onTap: () => context
                              .read<LifeCounterBloc>()
                              .add(LifeCounterDecrementPressed()),
                        ),
                      ),
                      Expanded(
                        key: const ValueKey(
                          'life_counter_widget_increment',
                        ),
                        child: GestureDetector(
                          onTap: () => context
                              .read<LifeCounterBloc>()
                              .add(LifeCounterIncrementPressed()),
                        ),
                      ),
                    ],
                  ),
                  _PlayerNameWidget(
                    name: textController.text,
                    onPressed: () {
                      context.pushNamed(
                        const CustomizePlayerRoute().name,
                        pathParameters: {
                          'player': player.playerNumber.toString()
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    return player.picture.isEmpty
        ? BoxDecoration(
            color: player.color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          )
        : BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(player.picture),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          );
  }
}

class _PlayerNameWidget extends StatelessWidget {
  const _PlayerNameWidget({required this.onPressed, required this.name});
  final void Function()? onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(name),
        ),
      ],
    );
  }
}
