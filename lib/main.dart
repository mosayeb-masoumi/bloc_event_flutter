import 'package:bloc_with_event/clean_arc_event/presentation/color_screen.dart';
import 'package:bloc_with_event/di.dart';
import 'package:bloc_with_event/example1/example1_screen.dart';
import 'package:flutter/material.dart';
import 'example2/example2_screen.dart';


void main() {
  setUpDI(); // to set get_it dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Example1Screen(),
      // home: const Example2Screen(),
      home: const ColorScreen(),
    );
  }
}

