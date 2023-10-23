import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrackerWidgets extends StatelessWidget {
  const TrackerWidgets({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView(
          children: const [
            _TrackerIcon(icon: FontAwesomeIcons.diamond),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.droplet),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.fire),
            SizedBox(height: AppSpacing.lg),
            _TrackerIcon(icon: FontAwesomeIcons.sun),
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
  State<_TrackerIcon> createState() => __TrackerIconState();
}

class __TrackerIconState extends State<_TrackerIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
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
