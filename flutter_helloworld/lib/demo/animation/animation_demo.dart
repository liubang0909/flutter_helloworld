import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animation'),
          elevation: 0,
        ),
        body: AnimationDemoHome(),
      ),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  AnimationDemoHome({Key key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;
  @override
  void initState() {
    super.initState();
    animationDemoController = AnimationController(
        // lowerBound: 30,
        // upperBound: 100,
        duration: Duration(milliseconds: 1000),
        vsync: this);

    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceInOut);
    animation = Tween(begin: 20.0, end: 100.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    animationDemoController.addListener(() {
      setState(() {});
    });
    animationDemoController.addStatusListener((status) {
      print(status);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AnimatedHeart(
      animations: [animation, animationColor],
      controller: animationDemoController,
    ));
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;
  AnimatedHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        color: animations[1].value,
        iconSize: animations[0].value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              controller.reverse();
              break;
            default:
              controller.forward();
          }
        },
      ),
    );
  }
}
