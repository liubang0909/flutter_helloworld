import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('RxDart'),
          elevation: 0,
        ),
        body: RxDartDemoHome(),
      ),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  void initState() {
    super.initState();

    // Stream<String> _stream = (Stream.fromIterable(['hello', '你好']));

    // Stream<String> _stream = Stream.fromFuture(Future.value('hello'));

    // Stream<String> _stream = Stream.periodic(Duration(seconds: 3), (count) {
    //   return count.toString();
    // });

    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 1);

    // _subject.listen((value) {
    //   print('listen 1:$value');
    // });
    // _subject.add('hello');
    // _subject.listen((value) {
    //   print('listen 2:$value');
    // });
    // _subject.add('hesss');

    // _subject.close();

    // _stream.listen(print);
    //

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
        //.map((item) => 'item:$item')
        .debounceTime(Duration(milliseconds: 500))
        // .where((item) => item.length > 9)
        .listen((value) {
      print("输入的内容是：$value");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: TextField(
          onChanged: (value) {
            _textFieldSubject.add(value);
          },
          onSubmitted: (value) {
            _textFieldSubject.add(value);
          },
          decoration: InputDecoration(
            labelText: 'title',
            filled: true,
          ),
        ));
  }
}
