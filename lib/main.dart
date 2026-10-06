import 'package:flutter/material.dart';
import 'package:stream_test/aysnc_generator.dart';
import 'package:stream_test/broadcast_stream.dart';
import 'package:stream_test/single_stream.dart';
import 'package:stream_test/stream_builder.dart';
import 'package:stream_test/stream_combine.dart';
import 'package:stream_test/stream_subscription.dart';
import 'package:stream_test/stream_transformation.dart';

void main() {
  runApp(MyApp());
  // singleStreamTest();
  // broadcastStreamTest();
  // streamSubscriptionTest();
  // asyncGeneratorTest();
  // streamTransformationTest();
  streamCombineTest();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: StreamBuilderPage()
    home: const SizedBox(),
    );
  }
}
