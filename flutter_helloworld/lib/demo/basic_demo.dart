import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://bkimg.cdn.bcebos.com/pic/91ef76c6a7efce1b5674491ba151f3deb58f6580?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyNzI=,g_7,xp_5,yp_5/format,f_auto"),
              alignment: Alignment.topCenter,
              fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Icon(Icons.pool, size: 32.0, color: Colors.white),
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.all(10.0),
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 22, 30, 1),
                border: Border.all(
                    color: Colors.redAccent[200],
                    width: 3,
                    style: BorderStyle.solid),
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(6.0, 7.0),
                      color: Colors.red[100],
                      blurRadius: 20.0,
                      spreadRadius: 10.0)
                ],
                shape: BoxShape.circle,
                // gradient:
                //     RadialGradient(colors: [Colors.red, Colors.yellow]),
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.yellow],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              )),
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key: key);
  final String _name = '丸子';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "丸子呦（别名：$_name）是一名网络女歌手 ，音乐代表作《广寒宫》、《甜》、《君在城墙下，我在城墙上》、《星河散尽故人来》网络主播、虎牙直播平台签约主播。",
        style: TextStyle(
          fontFamily: 'PingFangSC-Medium',
          fontSize: 15.0,
          color: Color.fromRGBO(64, 73, 93, 1),
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key key}) : super(key: key);
  final String _name = '丸子';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RichText(
            text: TextSpan(
                text:
                    '丸子呦（别名：$_name）是一名网络女歌手 ，音乐代表作《广寒宫》、《甜》、《君在城墙下，我在城墙上》、《星河散尽故人来》网络主播、虎牙直播平台签约主播。',
                style: TextStyle(
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 15.0,
                    color: Color.fromRGBO(64, 73, 93, 1)),
                children: [
          TextSpan(
              text: '专属天使',
              style: TextStyle(
                  fontFamily: 'PingFangSC-Medium',
                  fontSize: 15.0,
                  color: Colors.pink))
        ])));
  }
}
