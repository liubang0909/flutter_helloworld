import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
        elevation: 0,
      ),
      body: StreamDemoHome(),
    ));
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _streamSink;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamDemo = StreamController<String>();
    _streamDemo = StreamController.broadcast();

    _streamSink = _streamDemo.sink;

    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo);
  }

  void onDone() {
    debugPrint('done');
  }

  void onError(error) {
    debugPrint('$error');
  }

  void onData(String data) {
    debugPrint('$data');
  }

  void onDataTwo(String data) {
    debugPrint('onDataTwo$data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    // throw 'Something happended';
    return 'hello';
  }

  void _addDataToStream() async {
    debugPrint('add');
    String data = await fetchData();
    _streamSink.add(data);
    setState(() {
      _data = data;
    });
    // _streamDemo.add(data);
  }

  void _pauseStream() {
    debugPrint('pause');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    debugPrint('resume');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    debugPrint('cancel');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  child: Text('${snapshot.data}'),
                );
              },
            ),
            Text(_data),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _addDataToStream, child: Text('Add')),
                TextButton(onPressed: _pauseStream, child: Text('Pause')),
                TextButton(onPressed: _resumeStream, child: Text('Resume')),
                TextButton(onPressed: _cancelStream, child: Text('Cancel'))
              ],
            ),
          ],
        )),
      ),
    );
  }
}
