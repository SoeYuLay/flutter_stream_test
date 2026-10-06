import 'dart:async';

void streamTransformationTest() async {
  final numbersController = StreamController<int>();

  numbersController.stream
    .where((number) => number % 2 == 0) //only let even number
    .map((evenNumber) => evenNumber * evenNumber) //transform even number to their squares
    .take(3) //only take the first 3 squared even numbers
    .listen((squaredEven){
      print('Transformed data: $squaredEven');
  },
    onDone: (){
      print('Transformed stream is done!');
    },
    onError: (error) {
      print('Transformed stream error: $error');
    }
  );

  numbersController.sink.add(1);
  numbersController.sink.add(2); //passes where, maps to 4, taken (1st)
  numbersController.sink.add(3);
  numbersController.sink.add(4); //passes where, maps to 16, taken (2nd)
  numbersController.sink.add(5);
  numbersController.sink.add(6); //passes where, maps to 36, taken (3rd)
  numbersController.sink.add(7);
  numbersController.sink.add(8); //will not proceed due to take (3)

  await Future.delayed(Duration(milliseconds: 500));

  numbersController.close();
}

/*
Output

Transformed data: 4
Transformed data: 16
Transformed data: 36
Transformed stream is done!
 */