import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('http'),
          elevation: 0,
        ),
        body: HttpDemoHome(),
      ),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  HttpDemoHome({Key key}) : super(key: key);

  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPost().then((value) => print(value));
  }

  Future<List<Post>> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://resources.ninghao.net/demo/posts.json'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();

      return posts;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class Post {
  final String title;
  final String description;
  final String imageUrl;
  Post(this.title, this.description, this.imageUrl);

  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        imageUrl = json['imageUrl'];

  Map toJson() =>
      {'title': title, 'description': description, 'imageUrl': imageUrl};
}
