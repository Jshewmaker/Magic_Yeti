import 'package:flutter/material.dart';
import 'package:magic_yeti/life_counter/widgets/widgets.dart';

class LifeCounterPage extends StatelessWidget {
  const LifeCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: LifeCounterWidget(
                    color: Colors.blue,
                  ),
                ),
                Flexible(
                  child: LifeCounterWidget(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Flexible(
                  child: LifeCounterWidget(
                    color: Colors.green,
                  ),
                ),
                Flexible(
                  child: LifeCounterWidget(
                    color: Colors.orange,
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