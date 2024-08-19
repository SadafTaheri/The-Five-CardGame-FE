import 'package:flutter/material.dart';
import 'Sidebar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          child: Sidebar(),
        ),
        Expanded(
            child: Center(
          child: const Text('Home'),
        ))
      ],
    ));
  }
}
/*
body: Row(
children: [
Container(
width: 250.0,
color: Colors.grey[200],
child: Sidebar(),),
Expanded(
child: Center(
child: const Text ('Home page')
)
*/


/*
drawer: Sidebar(),
      body: const Center(
        child: Text("HomePage"),
      ),

*/