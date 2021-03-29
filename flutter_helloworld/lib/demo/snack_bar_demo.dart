import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  SnackBarDemo({Key key}) : super(key: key);

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar'),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SnackBarButton()],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  const SnackBarButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('展示文本'),
              action: SnackBarAction(
                label: 'Ok',
                onPressed: () {
                  debugPrint('点击了');
                },
              ),
            ));
          },
          child: Text('snackBar 点击')),
    );
  }
}
