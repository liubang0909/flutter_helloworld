import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // title: Text('wanzi'),
              // pinned: true,
              backgroundColor: Colors.red,
              // floating: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "wanziyoooo".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                      color: Colors.black),
                ),
                background: Image.network(
                  "https://wx1.sinaimg.cn/mw690/7e608cb2gy1gowdopbw8kj21o0280kjm.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverSafeArea(
              sliver: SliverPadding(
                padding: EdgeInsets.all(10),
                sliver: SliverListDemo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({Key key}) : super(key: key);
  final double _radius = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Material(
                borderRadius: BorderRadius.circular(_radius),
                elevation: 14,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(_radius),
                      child: Image.network(
                        posts1[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        left: 20,
                        top: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts1[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              posts1[index].author,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ));
        }, childCount: posts1.length),
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              child: Image.network(
                posts1[index].imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            );
          }, childCount: posts1.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1.0)),
    );
  }
}
