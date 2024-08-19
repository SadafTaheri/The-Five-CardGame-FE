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
      home: Home(),
    );
  }
}






// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // This is the sidebar (navigation bar)
//           const SideNavBar(),

//           // This is the main content area
//           Expanded(
//             child: Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//                 title: Text(widget.title),
//               ),
//               body: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text(
//                       'You have pushed the button this many times:',
//                     ),
//                     Text(
//                       '$_counter',
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                   ],
//                 ),
//               ),
//               floatingActionButton: FloatingActionButton(
//                 onPressed: _incrementCounter,
//                 tooltip: 'Increment',
//                 child: const Icon(Icons.add),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

