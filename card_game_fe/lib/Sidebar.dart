import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
          ListTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/assets/down.png', width: 70, height: 70),
                const SizedBox(height: 8),
                const Text(
                  'More',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
