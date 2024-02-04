import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:magic_yeti/player/bloc/player_bloc.dart';
import 'package:magic_yeti/tracker/bloc/tracker_bloc_bloc.dart';

class TrackerWidgets extends StatefulWidget {
  const TrackerWidgets({
    required this.rotate,
    required this.player,
    super.key,
  });

  final bool rotate;
  final int player;

  @override
  State<TrackerWidgets> createState() => _TrackerWidgetsState();
}

class _TrackerWidgetsState extends State<TrackerWidgets> {
  final counterList = <IconData>[FontAwesomeIcons.skullCrossbones];

  @override
  Widget build(BuildContext context) {
    final players = context.watch<PlayerBloc>().playerList;
    return RotatedBox(
      quarterTurns: widget.rotate ? 0 : 2,
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(.4),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView(
          children: [
            ...players.map(
              (e) => Column(
                children: [
                  _CommanderDamageTracker(
                    imageUrl: e.picture,
                    color: e.color,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
            ...counterList.map((e) => _CounterTracker(icon: Icon(e))),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.plus,
                color: AppColors.white,
              ),
              onPressed: () async {
                final icon = await _dialogBuilder(context);
                if (!counterList.contains(icon)) {
                  setState(() {
                    counterList.add(icon!);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<IconData?> _dialogBuilder(BuildContext context) {
    return showDialog<IconData>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Please Select A Counter.',
            style: TextStyle(color: AppColors.white),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.skullCrossbones),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.skullCrossbones),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.skullCrossbones),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.skullCrossbones),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, FontAwesomeIcons.droplet);
              },
              icon: const Icon(
                FontAwesomeIcons.droplet,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, FontAwesomeIcons.skullCrossbones);
              },
              icon: const Icon(
                FontAwesomeIcons.skullCrossbones,
              ),
            ),
          ],
        );
      },
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(widget.icon),
        const Text(
          '5',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ],
    );
  }
}

class _CommanderDamageTracker extends StatefulWidget {
  const _CommanderDamageTracker({
    required this.imageUrl,
    required this.color,
  });
  final String imageUrl;
  final Color color;
  @override
  State<_CommanderDamageTracker> createState() =>
      _CommanderDamageTrackerState();
}

class _CommanderDamageTrackerState extends State<_CommanderDamageTracker> {
  bool startTimer = false;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    const width = 60.0;
    const height = 50.0;
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
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      widget.imageUrl,
                      width: width,
                      height: height,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: widget.color,
                        width: width,
                        height: height,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  StrokeText(
                    text: state.counter.toString(),
                    fontSize: 28,
                    color: AppColors.white,
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

class _CounterTracker extends StatefulWidget {
  const _CounterTracker({
    required this.icon,
  });
  final Icon icon;
  @override
  State<_CounterTracker> createState() => _CounterTrackerState();
}

class _CounterTrackerState extends State<_CounterTracker> {
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
              child: Column(
                children: [
                  widget.icon,
                  StrokeText(
                    text: state.counter.toString(),
                    fontSize: 28,
                    color: AppColors.white,
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
