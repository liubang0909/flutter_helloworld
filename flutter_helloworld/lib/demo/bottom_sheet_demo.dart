import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 60,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.pause_circle_filled_outlined),
                SizedBox(
                  width: 16,
                ),
                Text('01:30 /03:30'),
                Expanded(
                  child:
                      Text('Fix you - Coldplay', textAlign: TextAlign.center),
                )
              ],
            ),
          );
        });
  }

  _openModalBottomOtherSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                )
              ],
            ),
          );
        });

    debugPrint(option);
  }

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((context) => (BottomAppBar(
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.pause_circle_filled_outlined),
                    SizedBox(
                      width: 16,
                    ),
                    Text('01:30 /03:30'),
                    Expanded(
                      child: Text('Fix you - Coldplay',
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _bottomSheetScaffoldKey,
        appBar: AppBar(
          title: Text('BottomSheetDemo'),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: _openBottomSheet,
                      child: Text('open BottomSheet')),
                ],
              ),
              FlatButton(
                  onPressed: _openModalBottomSheet,
                  child: Text('open Modal BottomSheet')),
              FlatButton(
                  onPressed: _openModalBottomOtherSheet,
                  child: Text('open Modal Other BottomSheet')),
            ],
          ),
        ),
      ),
    );
  }
}
