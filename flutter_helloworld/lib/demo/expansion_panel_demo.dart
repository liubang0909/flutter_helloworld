import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'panel 1',
        body: Container(
          padding: EdgeInsets.all(15),
          child: Text('1111111'),
          width: double.infinity,
        ),
        isExpaned: false,
      ),
      ExpansionPanelItem(
        headerText: 'panel 2',
        body: Container(
          padding: EdgeInsets.all(15),
          child: Text('22222222'),
          width: double.infinity,
        ),
        isExpaned: false,
      ),
      ExpansionPanelItem(
        headerText: 'panel 3',
        body: Container(
          padding: EdgeInsets.all(15),
          child: Text('33333333'),
          width: double.infinity,
        ),
        isExpaned: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ExpansionPanel'),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _expansionPanelItems[panelIndex].isExpaned = !isExpanded;
                  });
                },
                children: _expansionPanelItems.map((ExpansionPanelItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isExpaned,
                    body: item.body,
                    headerBuilder: (context, isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(12),
                        child: Text(item.headerText),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpaned;

  ExpansionPanelItem({this.headerText, this.body, this.isExpaned});
}
