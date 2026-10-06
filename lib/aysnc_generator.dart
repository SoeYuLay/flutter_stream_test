Stream<int> countStream(int max) async* {
  for(int i=1; i<=max; i++){
    await Future.delayed(Duration(milliseconds: 500));
    yield(i); //yield (emit) current value to stream
  }
}

void asyncGeneratorTest() {
  print('Starting stream ...');
  final subscription = countStream(5).listen((data){
    print('Received Data: $data');
  },
    onDone: (){
      print('Stream is done!');
    },
    onError: (error){
      print('Error in stream: $error');
    }
  );
}

/*
Output

Starting stream ...
Received Data: 1
Received Data: 2
Received Data: 3
Received Data: 4
Received Data: 5
Stream is done!
 */