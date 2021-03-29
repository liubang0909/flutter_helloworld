import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  PopupMenuButtonDemo({Key key}) : super(key: key);

  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("PopupMenuButtonDemo"),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_currentMenuItem),
                  PopupMenuButton(
                      onSelected: (value) {
                        debugPrint(value);
                        setState(() {
                          _currentMenuItem = value;
                        });
                      },
                      itemBuilder: (context) => [
                            PopupMenuItem(value: 'Home', child: Text('Home')),
                            PopupMenuItem(value: 'Home1', child: Text('Home1')),
                            PopupMenuItem(value: 'Home2', child: Text('Home2')),
                          ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
