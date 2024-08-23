import 'Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 133, 58)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// import 'package:card_game_fe/Cards/BigCard.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Card Preview'),
//         ),
//         body: Center(
//           child: BigCard(), // Your custom card widget
//         ),
//       ),
//     );
//   }
// }
