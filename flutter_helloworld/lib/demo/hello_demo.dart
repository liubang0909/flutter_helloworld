import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'hello world',
      textDirection: TextDirection.ltr,
      style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.bold, color: Colors.yellow),
    ));
  }
}
