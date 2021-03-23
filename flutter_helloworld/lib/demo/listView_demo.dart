import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(0.8),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(
            height: 10,
          ),
          Text(posts[index].title,
              style: Theme.of(context).textTheme.headline4),
          Text(posts[index].author,
              style: Theme.of(context).textTheme.subtitle1)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: _listItemBuilder, itemCount: posts.length);
  }
}
