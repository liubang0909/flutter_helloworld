import 'dart:async';

import 'package:flutter/material.dart';

class CounterBlocDemo extends StatelessWidget {
  const CounterBlocDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterBlocProvider.of(context).bloc;
    return Container(
      child: Center(
          child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: () {
                _counterBloc.counter.add(1);
              });
        },
      )),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  const CounterActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterBlocProvider.of(context).bloc;

    return Container(
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _counterBloc.onData(1);
        },
      ),
    );
  }
}

class CounterBlocProvider extends InheritedWidget {
  CounterBlocProvider({Key key, this.child, this.bloc})
      : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterBlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterBlocProvider>();
  }

  @override
  bool updateShouldNotify(CounterBlocProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count += data;
    _counterController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('CounterBloc');
  }
}
