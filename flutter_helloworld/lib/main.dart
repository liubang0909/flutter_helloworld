import 'package:flutter/material.dart';
import 'demo/drawer_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
          primaryColor: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.pink),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text("wanzi927"),
            elevation: 1.0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike))
              ],
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black38,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: 'navigration',
            //   onPressed: () => debugPrint("wanzi"),
            // ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'search',
                onPressed: () => debugPrint("search"),
              ),
            ],
          ),
          body: TabBarView(children: <Widget>[
            Icon(Icons.local_florist, size: 120, color: Colors.pink),
            Icon(Icons.local_florist, size: 120, color: Colors.yellow),
            Icon(Icons.local_florist, size: 120, color: Colors.black12)
          ]),
          drawer: DrawerDemo(),
          // endDrawer: Text('right drawer'),
        ),
      ),
    );
  }
}