import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String cardCost;
  final String characterName;
//...

  BigCard({
    @required this.cardCost,
    @required this.characterName,
    //...
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(children: [
        Image.asset("lib/assets/cardBase.png"),
        Positioned(
            top: 8,
            left: 30,
            child: Text(
              "Card Name",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ))
      ])),
    );
  }
}


//body: BigCard(cardCost: "cardCost", characterName: "characterName" ...) populates the card,
// can be used in this page?
