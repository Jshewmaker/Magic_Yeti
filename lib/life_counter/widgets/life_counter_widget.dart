import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/app_router/app_router.dart';
import 'package:magic_yeti/life_counter/bloc/life_counter_bloc.dart';

class LifeCounterWidget extends StatefulWidget {
  const LifeCounterWidget({required this.color, super.key});

  final Color color;

  @override
  State<LifeCounterWidget> createState() => _LifeCounterWidgetState();
}

class _LifeCounterWidgetState extends State<LifeCounterWidget> {
  final textController = TextEditingController(text: 'text');
  String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LifeCounterBloc(),
      child: BlocBuilder<LifeCounterBloc, LifeCounterState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl ?? ''), fit: BoxFit.fill),
              color: widget.color,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
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
                      key: const ValueKey('life_counter_widget_decrement'),
                      child: GestureDetector(
                        onTap: () => context
                            .read<LifeCounterBloc>()
                            .add(LifeCounterDecrementPressed()),
                      ),
                    ),
                    Expanded(
                      key: const ValueKey('life_counter_widget_increment'),
                      child: GestureDetector(
                        onTap: () => context
                            .read<LifeCounterBloc>()
                            .add(LifeCounterIncrementPressed()),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        imageUrl = await _showDialog();
                      },
                      child: Text(textController.text),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String?> _showDialog() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
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
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.height - 50,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          imageUrl = await AppRouter.of(context)
                              .goRouter
                              .push(const PlayerSettingsRoute().path);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(imageUrl ?? '')),
                            color: widget.color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          height: 200,
                          width: 300,
                        ),
                      ),
                      TextField(
                        controller: textController,
                        onChanged: (text) {
                          setState(() {
                            textController.text = text;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AppRouter.of(context).goRouter.pop(imageUrl);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
