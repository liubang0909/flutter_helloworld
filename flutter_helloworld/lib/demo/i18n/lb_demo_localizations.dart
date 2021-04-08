import 'package:intl/intl.dart';

class LbDemoLocalizations {
  String get title =>
      Intl.message('hello', name: 'title', desc: 'demo  of title');

  String greet(String name) => Intl.message('hello $name',
      name: 'greet', desc: 'greet fun', args: [name]);
}
