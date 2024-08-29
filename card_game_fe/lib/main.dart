import 'Home.dart';
import 'package:flutter/material.dart';
import 'Game/Game.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   bool isMenu = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 133, 58)),
        useMaterial3: true,
      ),
      home: isMenu? HomePage() : Game(),
    );
  }
}


