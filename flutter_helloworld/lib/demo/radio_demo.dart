import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  RadioDemo({Key key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupValue = 0;
  void _handlerRadioValueChanged(int value) {
    debugPrint('$value');
    setState(() {
      _radioGroupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Radio'),
          elevation: 0,
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.orange,
            highlightColor: Colors.grey.withOpacity(0.3),
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('_radioGroupValue$_radioGroupValue'),
                  RadioListTile(
                    title: Text('我是标题'),
                    subtitle: Text('我是副标题'),
                    secondary: Icon(Icons.ac_unit_sharp),
                    value: 0,
                    groupValue: _radioGroupValue,
                    onChanged: _handlerRadioValueChanged,
                    selected: _radioGroupValue == 0,
                  ),
                  RadioListTile(
                    title: Text('我是标题2'),
                    subtitle: Text('我是副标题2'),
                    secondary: Icon(Icons.access_alarm_outlined),
                    value: 1,
                    groupValue: _radioGroupValue,
                    onChanged: _handlerRadioValueChanged,
                    selected: _radioGroupValue == 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Radio(
                      //     value: 0,
                      //     groupValue: _radioGroupValue,
                      //     activeColor: Colors.orange,
                      //     onChanged: _handlerRadioValueChanged),
                      // Radio(
                      //     value: 2,
                      //     groupValue: _radioGroupValue,
                      //     onChanged: _handlerRadioValueChanged)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
