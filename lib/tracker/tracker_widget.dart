import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:magic_yeti/player/bloc/player_bloc.dart';
import 'package:magic_yeti/tracker/bloc/tracker_bloc_bloc.dart';

class TrackerWidgets extends StatelessWidget {
  const TrackerWidgets({
    required this.rotate,
    super.key,
  });

  final bool rotate;

  @override
  Widget build(BuildContext context) {
    print('print ${context.watch<PlayerBloc>().playerList[2].picture}');
    return RotatedBox(
      quarterTurns: rotate ? 0 : 2,
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(.4),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView(
          children: [
            _CommanderDamageTracker(
              imageUrl: context.watch<PlayerBloc>().playerList[0].picture,
            ),
            const SizedBox(height: AppSpacing.lg),
            _CommanderDamageTracker(
              imageUrl: context.watch<PlayerBloc>().playerList[1].picture,
            ),
            const SizedBox(height: AppSpacing.lg),
            _CommanderDamageTracker(
              imageUrl: context.watch<PlayerBloc>().playerList[2].picture,
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(.2)),
              ),
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.plus),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrackerIcon extends StatefulWidget {
  const _TrackerIcon({required this.icon});
  final IconData icon;
  @override
  State<_TrackerIcon> createState() => _TrackerIconState();
}

class _TrackerIconState extends State<_TrackerIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(widget.icon),
          const Text(
            '5',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }
}

class _CommanderDamageTracker extends StatefulWidget {
  const _CommanderDamageTracker({required this.imageUrl});
  final String imageUrl;
  @override
  State<_CommanderDamageTracker> createState() =>
      _CommanderDamageTrackerState();
}

class _CommanderDamageTrackerState extends State<_CommanderDamageTracker> {
  bool startTimer = false;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackerBloc(),
      child: BlocBuilder<TrackerBloc, TrackerBlocState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () =>
                context.read<TrackerBloc>().add(TrackerBlocIncremented()),
            onLongPress: () =>
                context.read<TrackerBloc>().add(TrackerBlocDecremented()),
            onLongPressUp: () =>
                context.read<TrackerBloc>().add(TrackerBlocStopDecrement()),
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(.1)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Image.network(
                      widget.imageUrl,
                      width: 30,
                      height: 30,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.black, // border color
                          shape: BoxShape.circle,
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    state.counter.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
