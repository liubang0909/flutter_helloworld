import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts1;
  int _selectedRowCount = 0;
  @override
  int get rowCount => _posts.length;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => _selectedRowCount;
  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ]);
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  PaginatedDataTableDemo({Key key}) : super(key: key);

  @override
  _PaginatedDataTableDemo createState() => _PaginatedDataTableDemo();
}

class _PaginatedDataTableDemo extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _dataSource = PostDataSource();

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
            PaginatedDataTable(
              header: Text('PaginatedDataTable'),
              source: _dataSource,
              rowsPerPage: 5,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: Text('colum1'),
                  onSort: (columnIndex, ascending) {
                    _dataSource._sort((post) => post.title.length, ascending);

                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                    });
                  },
                ),
                DataColumn(label: Text('colum2')),
                DataColumn(label: Text('image'))
              ],
            )
          ],
        )),
      ),
    );
  }
}
