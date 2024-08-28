import 'dart:async';

import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final Player playerOne = new Player('player1',[
    new Character(
        "Superman",
        50,
        100,
        new Ability("Critical Strike",
            "A very, very big hit that does big damage", "attack", 75, 5),
        100,
        "url_1"),
    new Character(
        "Batman",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_2"),
    new Character(
        "Batman2",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_3"),
    new Character(
        "Batman3",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_4"),
    new Character(
        "Batman4",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_5"),
  ], 2000);
  final Player playerTwo = new Player('Player2',[
    new Character(
        "GreenLantern",
        50,
        100,
        new Ability("Critical Strike",
            "A very, very big hit that does big damage", "attack", 75, 5),
        100,
        "url_1"),
    new Character(
        "Deadpool",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_2"),
    new Character(
        "Wolverine",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_3"),
    new Character(
        "blue beetle",
        40,
        80,
        new Ability("Sonic Scream", "Ouch, my ears!", "attack", 60, 4),
        80,
        "url_4")
  ], 1500);
  final bool isPlayerOne = true;
  @override
  Widget build(BuildContext context) {
    final Player activePlayer = isPlayerOne ? playerOne : playerTwo;
    final Player inactivePlayer = isPlayerOne ? playerTwo : playerOne;
    return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/battlepageBackground.jpg'),
                fit: BoxFit.fitHeight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Credit(inactivePlayer.credit)],
            ),
            OpponentRow(),
            PlayerRow(activePlayer, setState),
            BottomUi(activePlayer)
          ],
        ));
  }
}

// const Map numb1 = {
// 'name': "Ironman",
// 'health': 90,
// 'damage': 50,
// 'point_cost':90,
// 'imageURL': 'helowhw',
// 'ability': {
// 'name': "Rockets",
// 'description': "A very, very big ability",
// 'type': "attack",
// 'strength': 70,
// 'ability_cost': 4
// }
// };

class Credit extends StatelessWidget {
  final int creditLeft;
  const Credit(this.creditLeft);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown,
      ),
      child: Text(
        'Credit: ${creditLeft}',
        style: TextStyle(fontSize: 18),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class EmptyPosition extends StatelessWidget {
  const EmptyPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 160,
      child: Container(
          child: DecoratedBox(
              decoration: BoxDecoration(border: Border.all(width: 5)))),
    );
  }
}

class OpponentRow extends StatelessWidget {
  const OpponentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        EmptyPosition(),
        EmptyPosition(),
        EmptyPosition(),
        EmptyPosition(),
        EmptyPosition(),
      ],
    );
  }
}

class PlayerRow extends StatelessWidget {
  final Player player;
  final Function setState;
  const PlayerRow(this.player, this.setState);

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = []; //
    for (var i = 0; i <= 4; i++) {
      if (player.cardsInPlay[i] is Character) {
        cardList.add(BigCard(player.cardsInPlay[i]));
      } else {
        cardList.add(EmptyPositionTarget(i, player, setState));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cardList,
    );
  }
}

class PlayerHand extends StatelessWidget {
  final List<Character> charactersInHand;
  const PlayerHand(this.charactersInHand); // removed {super.key}

  @override
  Widget build(BuildContext context) {
    List<CardHandDrag> draggableCards =
        charactersInHand.map((Character characterCard) {
      return CardHandDrag(characterCard);
    }).toList();
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: draggableCards);
  }
}

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: DecoratedBox(decoration: BoxDecoration(color: Colors.amber)),
    );
  }
}

class Player {
  String name;
  int actionsLeft = 3;
  int credit;
  List<Character> cardsInHand;
  List<Character?> cardsInPlay = [
    null,
    null,
    null,
    null,
    null,
  ];
  Player(this.name,this.cardsInHand, this.credit);
}

class Ability {
  String name;
  String description;
  String type;
  int strength;
  int ability_cost;

  Ability(
      this.name, this.description, this.type, this.strength, this.ability_cost);
}

class Character {
  String name;
  int health;
  int damage;
  Ability ability;
  int point_cost;
  String imageURL;

  Character(this.name, this.health, this.damage, this.ability, this.point_cost,
      this.imageURL);
}


class InfoBar extends StatelessWidget {
  final Player activePlayer;
  const InfoBar(this.activePlayer);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Credit(activePlayer.credit),
        PlayerTurnInfo(activePlayer), // to do
        SurrenderBtn(), // to do
        EndTurnBtn() // to do
      ],
    ));
  }
}

class PlayerTurnInfo extends StatelessWidget {
  final Player activePlayer;
  const PlayerTurnInfo(this.activePlayer);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 14, 64, 110),
      ),
      child: Text(
        '${activePlayer.name}: ${activePlayer.actionsLeft} actions left',
        style: TextStyle(fontSize: 18),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class SurrenderBtn extends StatelessWidget {
  const SurrenderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 165, 46, 144),
      ),
      child: Container(
        height: 50,
        width: 200,
        child: TextButton(
          onPressed: () {
            print('surrender');
          },
          child: Text(
            'Surrender!!:(',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class EndTurnBtn extends StatelessWidget {
  const EndTurnBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 122, 193, 131),
      ),
      child: Container(
        height: 50,
        width: 200,
        child: TextButton(
          onPressed: () {
            print('End Turn :(');
          },
          child: Text(
            'End Turn :(',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class BottomUi extends StatelessWidget {
  final Player activePlayer;
  const BottomUi(this.activePlayer); // remove {super.key}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [InfoBar(activePlayer), PlayerHand(activePlayer.cardsInHand)],
    );
  }
}

class CardHandDrag extends StatelessWidget {
  final Character character;
  const CardHandDrag(this.character); // removed super.key

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: character,
      child: SmallCard(),
      feedback: SmallCard(),
      childWhenDragging: Container(),
    );
  }
}

class EmptyPositionTarget extends StatelessWidget {
  final Function setState;
  final Player player;
  final int index;
  const EmptyPositionTarget(this.index, this.player, this.setState);
  @override
  Widget build(BuildContext context) {
    return DragTarget<Character>(
      builder: (context, candidate, rejected) {
        return EmptyPosition();
      },
      onAcceptWithDetails: (value) {
        if (player.actionsLeft > 0) {
          var character = value.data;
          setState(() {
            player.cardsInPlay[index] = character;
            player.cardsInHand = player.cardsInHand.where((character) {
              return player.cardsInPlay[index] != character;
            }).toList();
            print(player.actionsLeft);
            player.actionsLeft--;
            print(player.actionsLeft);
            player.credit -= character.point_cost;
            print(player.credit);
          });

          print(player.cardsInPlay);
        }
      },
      onWillAcceptWithDetails: (value) {
        return true;
      },
    );
  }
}

class BigCard extends StatelessWidget {
  final Character? character;
  const BigCard(this.character);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 80,
      child: DecoratedBox(decoration: BoxDecoration(color: Colors.amber)),
    );
  }
}
