import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['A', 'B', 'C', 'D'];
  String _action = 'nothing';
  List<String> _selected = [];
  String _choice = 'default';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChipDemo'),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 15,
                runSpacing: 20,
                children: [
                  Chip(label: Text('121212121')),
                  Chip(label: Text('2222222'), backgroundColor: Colors.orange),
                  Chip(label: Text('4444444'), backgroundColor: Colors.pink),
                  Chip(
                    label: Text('City'),
                    deleteIcon: Icon(Icons.access_alarm_rounded),
                    deleteIconColor: Colors.red,
                    deleteButtonTooltipMessage: '删除提示',
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('2222222'),
                    backgroundColor: Colors.grey,
                    avatar: CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(
                          'https://bkimg.cdn.bcebos.com/pic/8d5494eef01f3a29fb43521f9725bc315d607c5c?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyNzI=,g_7,xp_5,yp_5/format,f_auto'),
                      // child: Text('刘'),
                    ),
                  ),
                  Divider(
                    color: Colors.blue,
                    thickness: 20,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: _tags.map((title) {
                      return Chip(
                        label: Text(title),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(title);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text("ActionChip : $_action"),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: _tags.map((title) {
                      return ActionChip(
                        label: Text(title),
                        onPressed: () {
                          setState(() {
                            _action = title;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text("FilterChip : ${_selected.toString()}"),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: _tags.map((title) {
                      return FilterChip(
                        label: Text(title),
                        selected: _selected.contains(title),
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              _selected.add(title);
                            });
                          } else {
                            setState(() {
                              _selected.remove(title);
                            });
                          }
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text("ChoiceChip : $_choice"),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: _tags.map((title) {
                      return ChoiceChip(
                        label: Text(title),
                        selectedColor: Colors.orange,
                        selected: _choice == title,
                        onSelected: (value) {
                          setState(() {
                            _choice = title;
                          });
                        },
                      );
                    }).toList(),
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _tags = ['A', 'B', 'C', 'D'];
              _selected = [];
              _choice = 'default';
            });
          },
        ),
      ),
    );
  }
}
