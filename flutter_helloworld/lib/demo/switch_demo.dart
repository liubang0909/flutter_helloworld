import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  SwitchDemo({Key key}) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _selected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SwitchDemo'),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchListTile(
                  value: _selected,
                  title: Text('我是标题'),
                  subtitle: Text('我是副标题'),
                  secondary: Icon(Icons.accessibility_new),
                  onChanged: (value) {
                    debugPrint('$value');
                    setState(() {
                      _selected = value;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_selected ? '打开' : '关闭'),
                  Switch(
                      value: _selected,
                      activeColor: Colors.green,
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
    );
  }
}
