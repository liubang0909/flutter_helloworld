import 'package:flutter/material.dart';

class TestDemo extends StatelessWidget {
  const TestDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          elevation: 0,
        ),
        body: TestDemoHome(),
      ),
    );
  }
}

class TestDemoHome extends StatefulWidget {
  TestDemoHome({Key key}) : super(key: key);

  @override
  _TestDemoHomeState createState() => _TestDemoHomeState();
}

class _TestDemoHomeState extends State<TestDemoHome> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Chip(label: Text('hello')),
          ActionChip(
              key: Key('actionChip'),
              label: Text(
                '$count',
                key: Key('actionChipLabel'),
              ),
              onPressed: () {
                setState(() {
                  count += 1;
                });
              })
        ],
      ),
    );
  }
}

class MyTestDemo {
  static greet(String name) {
    return 'hello ${name}1111';
  }
}
