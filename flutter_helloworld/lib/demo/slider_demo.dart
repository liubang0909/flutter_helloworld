import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _changeValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.red,
                    child: Slider(
                      min: 0.0,
                      max: 10.0,
                      divisions: 10,
                      value: _changeValue,
                      activeColor: Colors.cyan,
                      inactiveColor: Colors.cyan.withOpacity(0.3),
                      onChanged: (value) {
                        debugPrint('$value');
                        setState(() {
                          _changeValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text("${_changeValue.toInt()}"),
            ],
          ),
        ),
      ),
    );
  }
}
