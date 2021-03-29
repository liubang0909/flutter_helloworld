import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  final Widget flatButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FlatButton(
        onPressed: () {},
        child: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.black,
      ),
      FlatButton.icon(
        onPressed: () {},
        icon: Icon(Icons.access_alarm_outlined),
        label: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.red,
      )
    ],
  );

  final Widget raisedButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RaisedButton(
        onPressed: () {},
        child: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.black,
        color: Colors.blue,
      ),
      SizedBox(
        width: 16,
      ),
      RaisedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.access_alarm_outlined,
        ),
        label: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.red,
      )
    ],
  );
  final Widget outlineButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      OutlineButton(
        onPressed: () {},
        child: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.black,
        color: Colors.blue,
      ),
      OutlineButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.access_alarm_outlined,
        ),
        label: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.red,
      )
    ],
  );
  final Widget expandedButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          child: OutlineButton(
        onPressed: () {},
        child: Text('Button'),
        splashColor: Colors.blue,
        textColor: Colors.black,
      )),
      SizedBox(
        width: 16,
      ),
      Expanded(
        flex: 2,
        child: OutlineButton.icon(
          onPressed: () {},
          icon: Icon(Icons.access_alarm_outlined),
          label: Text('Button'),
          splashColor: Colors.blue,
          textColor: Colors.red,
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ButtonDemo"),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              flatButtonDemo,
              raisedButtonDemo,
              outlineButtonDemo,
              expandedButtonDemo,
            ],
          ),
        ),
      ),
    );
  }
}
