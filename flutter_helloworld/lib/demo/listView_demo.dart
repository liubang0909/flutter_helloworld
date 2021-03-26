import 'package:flutter/material.dart';
import '../model/post.dart';
import '../demo/post_show.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(0.8),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Image.network(posts[index].imageUrl),
              Positioned.fill(
                  child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () => (Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return PostShow(post: posts[index]);
                  }))),
                ),
              ))
            ],
          ),
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
