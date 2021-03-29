import 'package:flutter/material.dart';
import 'dart:async';

enum Option { A, B, C }

class SimpleDialogDemo extends StatefulWidget {
  SimpleDialogDemo({Key key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _chooseStr = 'nothing';

  Future _openSimpleDialog() async {
    final option = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            'simple',
            textAlign: TextAlign.center,
          ),
          children: [
            SimpleDialogOption(
              child: Text('option A', textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pop(context, Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text('option B', textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pop(context, Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text('option C', textAlign: TextAlign.center),
              onPressed: () {
                Navigator.pop(context, Option.C);
              },
            ),
          ],
        );
      },
    );

    switch (option) {
      case Option.A:
        setState(() {
          _chooseStr = 'A';
        });
        break;
      case Option.B:
        setState(() {
          _chooseStr = 'B';
        });
        break;
      case Option.C:
        setState(() {
          _chooseStr = 'C';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SimpleDialog"),
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
                  Text('choose is $_chooseStr'),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _openSimpleDialog,
        ),
      ),
    );
  }
}
