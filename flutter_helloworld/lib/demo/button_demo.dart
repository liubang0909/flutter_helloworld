import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  final Widget flatButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        onPressed: () {},
        child: Text('Button'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.blue),
          overlayColor: MaterialStateProperty.all(Colors.blue),
        ),
        // splashColor: Colors.blue,
        // textColor: Colors.black,
      ),
      TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.access_alarm_outlined),
        label: Text('Button'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.red),
          overlayColor: MaterialStateProperty.all(Colors.blue),
        ),
        // splashColor: Colors.blue,
        // textColor: Colors.red,
      )
    ],
  );

  final Widget raisedButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {},
        child: Text('Button'),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            overlayColor: MaterialStateProperty.all(Colors.blue)),
      ),
      SizedBox(
        width: 16,
      ),
      ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.access_alarm_outlined,
        ),
        label: Text('Button'),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red),
            overlayColor: MaterialStateProperty.all(Colors.blue)),
      )
    ],
  );
  final Widget outlineButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      OutlinedButton(
        onPressed: () {},
        child: Text('Button'),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(Colors.blue)),
      ),
      OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          Icons.access_alarm_outlined,
        ),
        label: Text('Button'),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(Colors.blue)),
      )
    ],
  );
  final Widget expandedButtonDemo = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
          child: OutlinedButton(
        onPressed: () {},
        child: Text('Button'),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(Colors.blue)),
      )),
      SizedBox(
        width: 16,
      ),
      Expanded(
        flex: 2,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.access_alarm_outlined),
          label: Text('Button'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              overlayColor: MaterialStateProperty.all(Colors.blue)),
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
