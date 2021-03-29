import 'package:flutter/material.dart';
import 'dart:async';

enum Action { Ok, Cancle }

class AlertDialogDemo extends StatefulWidget {
  AlertDialogDemo({Key key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _chooseString = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('你好'),
            content: Text('我是content'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Action.Cancle);
                  },
                  child: Text('cancle')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Action.Ok);
                  },
                  child: Text('Ok')),
            ],
          );
        });
    switch (action) {
      case Action.Cancle:
        {
          setState(() {
            _chooseString = 'Cancle';
          });
          break;
        }

      case Action.Ok:
        {
          setState(() {
            _chooseString = 'Ok';
          });
          break;
        }

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AlertDialog'),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('choose is  $_chooseString'),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      onPressed: _openAlertDialog, child: Text('AlertDialog'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
