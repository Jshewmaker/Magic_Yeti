import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/life_counter/bloc/life_counter_bloc.dart';

class LifeCounter extends StatelessWidget {
  const LifeCounter({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LifeCounterBloc(),
      child: BlocBuilder<LifeCounterBloc, LifeCounterState>(
        builder: (context, state) {
          return ColoredBox(
            color: color,
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
                      child: GestureDetector(
                        onTap: () => context
                            .read<LifeCounterBloc>()
                            .add(LifeCounterDecrementPressed()),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context
                            .read<LifeCounterBloc>()
                            .add(LifeCounterIncrementPressed()),
                      ),
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
}
