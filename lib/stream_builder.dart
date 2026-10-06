import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({super.key});

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  final _dataController = StreamController<int>();
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer){
      _counter++;
      _dataController.sink.add(_counter);
      if(_counter >= 5){
        timer.cancel();
        _dataController.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder Sample')),
      body: Center(
        child: StreamBuilder<int>
          (stream: _dataController.stream,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              }else if (snapshot.hasData){
                return Text('Received Data: ${snapshot.data}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,));
              }else{
                return Text('No data yet or stream closed');
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
    );
  }

  @override
  void dispose() {
    _dataController.close();
    super.dispose();
  }
}
