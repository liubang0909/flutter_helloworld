import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  CardDemo({Key key}) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('card'),
          elevation: 0,
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: posts1.map((post) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0)),
                          child: Image.network(
                            post.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(post.imageUrl),
                        ),
                        title: Text(post.title),
                        subtitle: Text(post.author),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(post.describe),
                      )
                    ],
                  ),
                );
              }).toList(),
            )),
      ),
    );
  }
}
