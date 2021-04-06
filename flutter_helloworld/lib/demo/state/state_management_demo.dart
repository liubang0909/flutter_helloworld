import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagement'),
          elevation: 0,
        ),
        body: CounterProvider(
          _count,
          _increaseCount,
          child: CounterWrapper(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  const CounterWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ActionChip(
            label: Text("${CounterProvider.of(context).count}"),
            onPressed: CounterProvider.of(context).increaseCount),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final Widget child;
  final VoidCallback increaseCount;

  CounterProvider(this.count, this.increaseCount, {Key key, this.child})
      : super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}
