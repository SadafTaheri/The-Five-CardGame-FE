import 'package:flutter/material.dart';
import 'Sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "lib/assets/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(child: Image.asset("lib/assets/title.png")),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
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