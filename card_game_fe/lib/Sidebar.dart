import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      color: const Color.fromARGB(255, 70, 52, 81),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Expanded()

          ListTile(
            leading: SizedBox(child: Image.asset('lib/assets/hut.png')),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              //Navigate to Home
            },
          ),
          ListTile(
            leading: Image.asset('lib/assets/swords.png'),
            title: const Text('Battle', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to PlayPage
            },
          ),
          ListTile(
            leading: Image.asset('lib/assets/playing-cards.png'),
            title:
                const Text('Collection', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Collection
            },
          ),
          ListTile(
            leading: Image.asset('lib/assets/treasure.png'),
            title: const Text('Shop', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Shop
            },
          ),
          ListTile(
            leading: Image.asset('lib/assets/down.png'),
            title: const Text('More', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to More
            },
          ),
        ],
      ),
    );
  }
}
