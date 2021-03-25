import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Container(
            color: Colors.red,
          )),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.blue,
                  gradient:
                      RadialGradient(colors: [Colors.red, Colors.orange])),
              child: IconBadge(
                Icons.brightness_2,
              ),
            ),
          ),
          Positioned(right: 20.0, top: 15.0, child: IconBadge(Icons.ac_unit)),
          Positioned(right: 10.0, top: 35.0, child: IconBadge(Icons.ac_unit)),
          Positioned(right: 20.0, top: 75.0, child: IconBadge(Icons.ac_unit)),
          Positioned(right: 40.0, top: 100.0, child: IconBadge(Icons.ac_unit)),
          Positioned(right: 50.0, top: 152.0, child: IconBadge(Icons.ac_unit)),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  IconBadge(this.icon, {this.size = 20.0, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 5,
      height: size + 5,
      color: color,
    );
  }
}
