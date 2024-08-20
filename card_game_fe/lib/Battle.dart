import 'package:flutter/material.dart';

class Battle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
          child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                "lib/assets/2.jpeg",
                fit: BoxFit.cover,
              ))),
      Positioned(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
          ),
          child: Text("Game Info"),
        ),
      ),
    ]);
  }
}
