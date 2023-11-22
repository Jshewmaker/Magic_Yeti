import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrackerWidgets extends StatelessWidget {
  const TrackerWidgets({
    required this.rotate,
    super.key,
  });

  final bool rotate;

  @override
  Widget build(BuildContext context) {
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
          children: const [
            _CommanderDamageTracker(
              imageUrl: '',
            ),
            SizedBox(height: AppSpacing.lg),
            _CommanderDamageTracker(imageUrl: ''),
            SizedBox(height: AppSpacing.lg),
            _CommanderDamageTracker(imageUrl: ''),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.diamond),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.droplet),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.fire),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.sun),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.plus),
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
          CircleAvatar(
            maxRadius: 15,
            foregroundImage: NetworkImage(widget.imageUrl),
          ),
          const Text(
            '5',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      ),
    );
  }
}
