import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color.fromARGB(255, 70, 52, 81),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('lib/assets/hut.png')),
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
