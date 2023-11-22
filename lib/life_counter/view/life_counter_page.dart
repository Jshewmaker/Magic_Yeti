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
                    child: Stack(
                      children: [
                        LifeCounterWidget(
                          playerNumber: 3,
                          color: Colors.blue,
                        ),
                        TrackerWidgets(
                          rotate: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Expanded(
                    flex: 10,
                    child: Stack(
                      children: [
                        LifeCounterWidget(
                          playerNumber: 2,
                          color: Colors.red,
                        ),
                        TrackerWidgets(
                          rotate: true,
                        ),
                      ],
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
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        LifeCounterWidget(
                          playerNumber: 3,
                          color: Colors.green,
                        ),
                        TrackerWidgets(
                          rotate: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Expanded(
                    flex: 10,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        LifeCounterWidget(
                          playerNumber: 1,
                          color: Colors.orange,
                        ),
                        TrackerWidgets(
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
      ),
    );
  }
}
