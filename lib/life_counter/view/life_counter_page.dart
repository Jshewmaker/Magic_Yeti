import 'package:app_ui/app_ui.dart';
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
                    flex: 10,
                    child: LifeCounterWidget(
                      playerNumber: 3,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Expanded(
                    flex: 10,
                    child: LifeCounterWidget(
                      playerNumber: 2,

                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
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
                    child: LifeCounterWidget(
                      playerNumber: 4,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Expanded(
                    flex: 10,
                    child: LifeCounterWidget(
                      playerNumber: 1,

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
