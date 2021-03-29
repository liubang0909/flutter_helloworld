import 'package:flutter/material.dart';

class FloatActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {
      debugPrint("点击了");
    },
    child: Icon(Icons.add),
    elevation: 0,
    backgroundColor: Colors.pink,
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {
      debugPrint("点击了");
    },
    icon: Icon(Icons.add),
    label: Text('add'),
    elevation: 0,
    backgroundColor: Colors.pink,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FloatActionButtonDemo'),
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _floatingActionButton,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 80,
          ),
          color: Colors.red,
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}
