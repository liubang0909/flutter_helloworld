import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  CheckboxDemo({Key key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkbox'),
          elevation: 0.0,
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxListTile(
                  value: _selected,
                  onChanged: (value) {
                    debugPrint('$value');
                    setState(() {
                      _selected = value;
                    });
                  },
                  title: Text('选择框标题'),
                  subtitle: Text('选择框副标题'),
                  secondary: Icon(Icons.bookmark),
                  selected: _selected,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: _selected,
                        activeColor: Colors.pink,
                        onChanged: (value) {
                          debugPrint('$value');
                          setState(() {
                            _selected = value;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
