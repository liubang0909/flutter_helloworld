import 'package:flutter/material.dart';
import 'counter_bloc_demo.dart';

class BlocDemo extends StatelessWidget {
  const BlocDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterBlocProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc'),
          elevation: 0,
        ),
        body: CounterBlocDemo(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
