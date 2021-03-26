import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  const NavigatorDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(onPressed: null, child: Text("Home")),
              FlatButton(
                  onPressed: () => (Navigator.pushNamed(context, "/about")
                      // Navigator.of(context).pushNamed('/about')

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //   builder: (BuildContext context) => (PageDemo(
                      //         title: 'about',
                      //       )
                      //       )
                      //       )
                      ),
                  child: Text("About"))
            ],
          ),
        ),
      ),
    );
  }
}

class PageDemo extends StatelessWidget {
  final String title;

  const PageDemo({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () => (Navigator.pop(context)),
        ),
      ),
    );
  }
}
