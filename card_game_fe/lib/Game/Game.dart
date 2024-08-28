import 'package:flutter/material.dart';

import 'Board.dart';

class Game extends StatelessWidget {
  const Game({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Board(),
    );
  }
}