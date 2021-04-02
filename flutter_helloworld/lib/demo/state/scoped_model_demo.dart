import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelDemo extends StatelessWidget {
  const ScopedModelDemo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: CounterModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('ScopedModel'),
            elevation: 0,
          ),
          body: CounterWrapper(),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) {
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.increaseCount,
              );
            },
          ),
        ));
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
        child: ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => (Center(
        child: ActionChip(
          label: Text("${model.count}"),
          onPressed: model.increaseCount,
        ),
      )),
    ));
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    debugPrint("$_count");
    notifyListeners();
  }
}
