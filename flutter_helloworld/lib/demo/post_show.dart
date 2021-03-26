import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;
  const PostShow({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(post.title),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(post.imageUrl),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                    '丸子呦（别名：丸子）是一名网络女歌手 ，音乐代表作《广寒宫》、《甜》、《君在城墙下，我在城墙上》、《星河散尽故人来》网络主播、虎牙直播平台签约主播。'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
