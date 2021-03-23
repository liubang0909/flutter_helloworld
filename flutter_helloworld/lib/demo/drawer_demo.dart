import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //     child: Text('header'.toUpperCase()),
          //     decoration: BoxDecoration(
          //       color: Colors.grey[100],
          //     )),
          UserAccountsDrawerHeader(
            accountName: Text(
              'liubang',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            accountEmail: Text(
              '1548033152@qq.com',
              style: TextStyle(color: Colors.black87),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://wx3.sinaimg.cn/mw690/7e608cb2gy1goexmzmyycj21sc2dskjl.jpg"),
            ),
            decoration: BoxDecoration(
                color: Colors.pink,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://wx4.sinaimg.cn/mw690/7e608cb2gy1gontsl0gbhj20u00nzdj5.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.orange[200].withOpacity(0.5),
                        BlendMode.hardLight))),
          ),

          ListTile(
            title: Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            title: Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            title: Text(
              'Settings',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: () => {Navigator.pop(context)},
          ),
        ],
      ),
    ));
  }
}
