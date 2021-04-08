import 'package:flutter/material.dart';
import 'demo/i18n/i18n_demo.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottomNavigationBar_demo.dart';
import 'demo/listView_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
// import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';
// import 'demo/state/state_management_demo.dart';
import 'demo/state/scoped_model_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/animation/animation_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'demo/i18n/ninhao_demo_localizations.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: NavigatorDemo(),

      locale: Locale('zh', 'CN'),
      // localeResolutionCallback:
      //     (Locale local, Iterable<Locale> supportedLocales) {
      //   return Locale('en', 'US');
      // },
      localizationsDelegates: [
        NinhaoDemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],

      initialRoute: '/i18n',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => (PageDemo(title: 'About')),
        '/form': (context) => (FormDemo()),
        '/mdc': (context) => (MaterialComponents()),
        '/state-management': (context) => (ScopedModelDemo()),
        '/stream': (context) => (StreamDemo()),
        '/rxdart': (context) => (RxDartDemo()),
        '/bloc': (context) => (BlocDemo()),
        '/http': (context) => (HttpDemo()),
        '/animation': (context) => (AnimationDemo()),
        '/i18n': (context) => (I18nDemo())
      },
      theme: ThemeData(
          primaryColor: Colors.blue,
          accentColor: Colors.red,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.pink),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text("wanzi"),
            elevation: 1.0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_quilt))
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
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            // ViewDemo()
            SliverDemo()
          ]),
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo(),

          // endDrawer: Text('right drawer'),
        ),
      ),
    );
  }
}
