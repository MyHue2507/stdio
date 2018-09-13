import 'package:flutter/material.dart';

class WalkThroughHome extends StatefulWidget {
  final image;

  WalkThroughHome({this.image});

  @override
  WalkThroughHomeState createState() {
    return WalkThroughHomeState();
  }
}

class WalkThroughHomeState extends State<WalkThroughHome>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animation.addListener(() => setState(() {}));
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
            animationDuration: Duration(milliseconds: 500),
            elevation: 2.0,
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150.0,
            ),
          )
    );
  }
}
