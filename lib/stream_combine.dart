//Stream.fromFutures

Future<String> fetchUserData(String userId) async {
  await Future.delayed(Duration(seconds: 1));
  return 'User Data for $userId';
}

Future<String> fetchProductData(String productId) async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'Product Data for $productId';
}

void streamCombineTest() {
  final userFuture = fetchUserData('user123');
  final productFuture = fetchProductData('prod456');

  Stream.fromFutures([userFuture, productFuture]).listen((data){
    print('Received: $data');
  },
    onDone: (){
      print('All futures completed and stream is done.');
    },
    onError: (error){
      print('Error: $error');
    }
  );
}

/*
Output

Received: Product Data for prod456
Received: User Data for user123
All futures completed and stream is done.
 */