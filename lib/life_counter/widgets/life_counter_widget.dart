import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/app_router/app_router.dart';
import 'package:magic_yeti/life_counter/bloc/life_counter_bloc.dart';

class LifeCounterWidget extends StatefulWidget {
  const LifeCounterWidget({
    required this.color,
    required this.playerNumber,
    super.key,
  });

  final Color color;
  final int playerNumber;

  @override
  State<LifeCounterWidget> createState() => _LifeCounterWidgetState();
}

class _LifeCounterWidgetState extends State<LifeCounterWidget> {
  final textController = TextEditingController(text: 'player');
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: widget.playerNumber < 3 ? 0 : 2,
      child: Container(
        decoration: _getDecoration(),
        child: BlocProvider(
          create: (context) => LifeCounterBloc(),
          child: BlocBuilder<LifeCounterBloc, LifeCounterState>(
            builder: (context, state) {
              return Stack(
                children: [
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
                    onPressed: () async {
                      imageUrl = await _showDialog();
                      setState(() {
                        imageUrl = imageUrl;
                      });
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

  Future<String?> _showDialog() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width - 750,
                        height: MediaQuery.of(context).size.height - 500,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                String? returnedValue;
                                returnedValue = await AppRouter.of(context)
                                    .goRouter
                                    .push(const PlayerSettingsRoute().path);
                                imageUrl = returnedValue ?? imageUrl;
                              },
                              child: imageUrl == null
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: widget.color,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      height: 200,
                                      width: 300,
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(imageUrl ?? ''),
                                        ),
                                        color: widget.color,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      height: 200,
                                      width: 300,
                                    ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    controller: textController,
                                    onChanged: (text) {
                                      setState(() {
                                        textController.text = text;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                ElevatedButton(
                                  onPressed: () {
                                    AppRouter.of(context)
                                        .goRouter
                                        .pop(imageUrl);
                                  },
                                  child: const Text('ok'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  BoxDecoration _getDecoration() {
    return imageUrl == null
        ? BoxDecoration(
            color: widget.color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          )
        : BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl ?? ''),
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
