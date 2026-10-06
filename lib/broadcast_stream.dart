import 'dart:async';

void broadcastStreamTest() async {
  final broadcastController = StreamController<int>.broadcast();

  //Listener 1
  broadcastController.stream.listen(
    (event) {
      print('Listener 1 received: $event');
    },
    onError: (error) {
      print('Listener 1 error: $error');
    },
  );

  //Listener 2
  broadcastController.stream.listen(
    (event) {
      print('Listener 2 received: $event');
    },
    onError: (error) {
      print('Listener 2 error: $error');
    },
  );

  broadcastController.sink.add(1);
  await Future.delayed(Duration(milliseconds: 500));
  broadcastController.sink.add(2);
  await Future.delayed(Duration(milliseconds: 500));
  broadcastController.sink.addError('Broadcast error');
  await Future.delayed(Duration(milliseconds: 500));
  broadcastController.sink.add(3);

  await Future.delayed(Duration(milliseconds: 500));
  broadcastController.close();
}

/*
Output

Listener 1 received: 1
Listener 2 received: 1
Listener 1 received: 2
Listener 2 received: 2
Listener 1 error: Broadcast error
Listener 2 error: Broadcast error
Listener 1 received: 3
Listener 2 received: 3
 */
