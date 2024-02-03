import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/life_counter/widgets/widgets.dart';
import 'package:magic_yeti/player/bloc/player_bloc.dart';
import 'package:magic_yeti/tracker/tracker.dart';

// class LifeCounterPage extends StatefulWidget {
//   const LifeCounterPage({super.key});

//   @override
//   State<LifeCounterPage> createState() => _LifeCounterPageState();
// }

// class _LifeCounterPageState extends State<LifeCounterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: LifeCounterView(),
//     );
//   }
// }

class LifeCounterPage extends StatelessWidget {
  const LifeCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PlayerBloc>().state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Stack(
                    children: [
                      LifeCounterWidget(
                        player: state.playerList[3],
                      ),
                      const TrackerWidgets(
                        rotate: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Expanded(
                  flex: 10,
                  child: Stack(
                    children: [
                      LifeCounterWidget(
                        player: state.playerList[1],
                      ),
                      const TrackerWidgets(
                        rotate: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.refresh,
                  size: 50,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      LifeCounterWidget(
                        player: state.playerList[2],
                      ),
                      const TrackerWidgets(
                        rotate: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Expanded(
                  flex: 10,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      LifeCounterWidget(
                        player: state.playerList[0],
                      ),
                      const TrackerWidgets(
                        rotate: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
