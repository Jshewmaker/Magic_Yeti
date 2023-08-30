import 'package:flutter/material.dart';

class SlideOutMenu extends StatefulWidget {
  const SlideOutMenu({super.key});

  @override
  State<SlideOutMenu> createState() => _SlideOutMenuState();
}

class _SlideOutMenuState extends State<SlideOutMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // offset = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0)).animate(controller); from right
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -1.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: ElevatedButton(
              child: Text('Show / Hide'),
              onPressed: () {
                switch (controller.status) {
                  case AnimationStatus.completed:
                    controller.reverse();
                    break;
                  case AnimationStatus.dismissed:
                    controller.forward();
                    break;
                  default:
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
                position: offset,
                child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.9,
                          spreadRadius: 0.5,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: InkWell(
                    onTap: () {
                      controller.reverse();
                    },
                    child: Center(
                      child: Text(
                        'ssss',
                        style: TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
