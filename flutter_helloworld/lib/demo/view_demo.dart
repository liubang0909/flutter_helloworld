import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: GridViewBuilderDemo());
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key key}) : super(key: key);

  Widget _gridViewItemBuild(BuildContext context, int index) {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment(0, 0),
      child: Image.network(
        posts1[index].imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
      itemCount: posts1.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
      itemBuilder: _gridViewItemBuild,
    ));
  }
}

class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({Key key}) : super(key: key);

  List<Widget> _buildTitles(int count) {
    return List.generate(
        count,
        (index) => (Container(
              color: Colors.grey[300],
              alignment: Alignment(0, 0),
              child: Text(
                'item$index',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: _buildTitles(100),
      ),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key key}) : super(key: key);

  List<Widget> _buildTitles(int count) {
    return List.generate(
        count,
        (index) => (Container(
              color: Colors.grey[300],
              alignment: Alignment(0, 0),
              child: Text(
                'item$index',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: _buildTitles(100),
      ),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({Key key}) : super(key: key);
  Widget _pageViewBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  posts[index].title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  posts[index].author,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: posts.length,
        itemBuilder: _pageViewBuilder,
      ),
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        pageSnapping: true,
        reverse: false,
        scrollDirection: Axis.vertical,
        onPageChanged: (currentPage) => debugPrint("pageindex:$currentPage"),
        controller: PageController(
          initialPage: 1,
          keepPage: false,
          viewportFraction: 0.85,
        ),
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "丸仔",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.yellow,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "丸子",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "琪琪",
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
