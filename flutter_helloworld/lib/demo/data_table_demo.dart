import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo({Key key}) : super(key: key);

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('DataTable'),
          elevation: 0,
        ),
        body: Container(
            child: ListView(
          children: [
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: Text('colum1'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(label: Text('colum2')),
                DataColumn(label: Text('image'))
              ],
              rows: posts1.map((post) {
                return DataRow(
                    selected: post.selected,
                    onSelectChanged: (value) {
                      setState(() {
                        if (value != post.selected) {
                          post.selected = value;
                        }
                      });
                    },
                    cells: [
                      DataCell(Container(
                        width: 100,
                        decoration: BoxDecoration(color: Colors.orange),
                        child: Text(
                          post.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue),
                        ),
                      )),
                      DataCell(Text(post.author)),
                      DataCell(Image.network(post.imageUrl))
                    ]);
              }).toList(),
            )
          ],
        )),
      ),
    );
  }
}
