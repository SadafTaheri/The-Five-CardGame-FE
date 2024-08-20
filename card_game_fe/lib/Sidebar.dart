import 'package:flutter/material.dart';
// import 'Home.dart';
// import 'Battle.dart';
// import 'Collection.dart';
// import 'Shop.dart';
// import 'Instructions.dart';
// import 'Logout.dart';

class Sidebar extends StatelessWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;
  const Sidebar(
      {Key? key, required this.onItemSelected, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.blue, width: 5.0)),
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromARGB(255, 102, 1, 149),
                Color.fromARGB(255, 44, 19, 23),
              ])),
      // color: const Color.fromARGB(255, 70, 52, 81),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Expanded()

          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/hut.png', width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'Home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            selected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/swords.png', width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'Battle',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            selected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/playing-cards.png',
                    width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'Collections',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            selected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
          ),
          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/treasure.png', width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'Shop',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            selected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
          ),
          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/instructions.png',
                    width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'How to play',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            selected: selectedIndex == 4,
            onTap: () => onItemSelected(4),
          ),
          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/logout.png', width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'Log out',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            selected: selectedIndex == 5,
            onTap: () => onItemSelected(5),
          ),
        ],
      ),
    );
  }
}
