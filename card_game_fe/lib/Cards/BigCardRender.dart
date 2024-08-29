import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './CardClasses.dart';

class BigCardRender extends StatelessWidget {
  final String cardCost;
  final String image_url;
  final String characterName;
  final Ability ability;
  final String health;
  final String damage;

  BigCardRender({
    required this.cardCost,
    required this.image_url,
    required this.characterName,
    required this.ability,
    required this.damage,
    required this.health,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      child: Card(
          child: Stack(children: [
        Image.asset(
          "lib/assets/cardBase.png",
          fit: BoxFit.cover,
          width: 150,
          height: 200,
        ),

        //CARD COST
        Positioned(
            top: -2,
            left: 4,
            child: Row(children: [
              Image.asset(
                "lib/assets/whiteCoin.png",
                height: 12,
              ),
              Text(
                cardCost.toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              )
            ])),

        //IMAGE

        Positioned(
          top: 10,
          left: 6.1,
          width: 130.6,
          height: 85,
          child: Image.asset("lib/assets/characters/${image_url}",
              fit: BoxFit.cover),
        ),

        Stack(
          children: [
            //MARBLE
            Positioned(
              bottom: 6.5,
              left: 3,
              height: 87,
              width: 137,
              child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.darken),
                  child: Image.asset("lib/assets/redMarble.jpg",
                      fit: BoxFit.cover)),
            ),

            //NAME
            Positioned(
                top: 98,
                left: 2,
                right: 2,
                child: Text(
                  characterName,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                  textAlign: TextAlign.center,
                )),

            //Special
            Positioned(
                top: 123,
                left: 4,
                right: 4,
                child: Column(children: [
                  Text(ability.name,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                      textAlign: TextAlign.center),
                  Text(ability.description,
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                      textAlign: TextAlign.center)
                ])),

            //HP
            Positioned(
                bottom: 4,
                left: 3,
                child: Row(children: [
                  const Icon(
                    CupertinoIcons.heart,
                    color: Colors.white,
                    size: 13,
                  ),
                  Text(
                    health.toString(),
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  )
                ])),

            //DAMAGE
            Positioned(
                bottom: 4,
                right: 3,
                child: Row(
                  children: [
                    Image.asset("lib/assets/whiteSword.png", width: 10),
                    Text(
                      damage.toString(),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                )),
          ],
        ),
      ])),
    );
  }
}
