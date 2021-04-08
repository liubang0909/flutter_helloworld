import 'package:flutter/material.dart';
import 'package:flutter_helloworld/demo/i18n/ninhao_demo_localizations.dart';

class I18nDemo extends StatelessWidget {
  const I18nDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('i18n'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${locale.toString()}'),
              Text(
                // Localizations.of(context, NinhaoDemoLocalizations).title,
                NinhaoDemoLocalizations.of(context).title,

                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class I18nDemoHome extends StatefulWidget {
  I18nDemoHome({Key key}) : super(key: key);

  @override
  _I18nDemoHomeState createState() => _I18nDemoHomeState();
}

class _I18nDemoHomeState extends State<I18nDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
