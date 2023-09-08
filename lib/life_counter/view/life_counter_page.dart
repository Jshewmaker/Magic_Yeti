import 'package:flutter/material.dart';
import 'package:magic_yeti/life_counter/widgets/widgets.dart';

class LifeCounterPage extends StatelessWidget {
  const LifeCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    child: LifeCounterWidget(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: LifeCounterWidget(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('hello')],
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    child: LifeCounterWidget(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: LifeCounterWidget(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
