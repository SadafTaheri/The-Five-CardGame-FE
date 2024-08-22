import 'package:flutter/material.dart';

class Battle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                "lib/assets/space.jpeg",
                fit: BoxFit.cover,
              ))),
      Positioned(
        
          top: 10,
          left: 10,
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            bool _isSwitched = false;
            return Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                });
          }))
    ]));
  }
}
