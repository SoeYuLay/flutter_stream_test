import 'dart:async';

void streamSubscriptionTest() async {
  final streamController = StreamController<String>();

  StreamSubscription<String>? subscription;

  subscription = streamController.stream.listen((data){
    print('Received Data: $data');
    if(data == 'Stop'){
      print('Cancelling subscription');
      subscription?.cancel();
      streamController.close();
    }
  },
    onError: (error) => print('Error: $error'),
    onDone: () => print('Stream is done (closed)!'),
    cancelOnError: false //Do not cancel the subscription if error occurs
  );

  streamController.sink.add('Start');
  await Future.delayed(Duration(milliseconds: 500));
  streamController.sink.add('Continue');
  await Future.delayed(Duration(milliseconds: 500));
  streamController.sink.add('Stop');
}