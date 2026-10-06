import 'dart:async';

void singleStreamTest() async {
  final streamController = StreamController<String>();

  Stream<String> myStream = streamController.stream;

  myStream.listen(
    (data) {
      print('Received data: $data');
    },
    onError: (error) {
      print('Captured error: $error');
    },
    onDone: () {
      print('Stream completed and closed');
    },
  );

  streamController.sink.add('Hello');
  streamController.sink.add('Flutter');
  streamController.sink.add('Streams!');

  streamController.sink.addError('Something went wrong');

  await Future.delayed(Duration.zero);
  await streamController.close();
}

/*
Output

Received data: Hello
Received data: Flutter
Received data: Streams!
Captured error: Something went wrong
Stream completed and closed
 */