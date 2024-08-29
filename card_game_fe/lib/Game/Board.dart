import 'package:card_game_fe/Cards/BigCardRender.dart';
import 'package:flutter/material.dart';
import '../Cards/CardClasses.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final Player playerOne = new Player(
      'Player One',
      [
        new Character(
            "Jon Snow",
            85,
            40,
            new Ability(
                "Frost Strike",
                "A chilling attack that deals significant damage to the opponent.",
                "attack",
                75,
                5),
            750,
            "jonSnow.jpg"),
        new Character(
            "Daenerys Targaryen",
            75,
            45,
            new Ability(
                "Dragon's Fury",
                "Unleashes a powerful fire attack that scorches enemies.",
                "attack",
                60,
                4),
            770,
            "daenarysTargaryen.webp"),
        new Character(
            "Rick Sanchez",
            70,
            30,
            new Ability(
                "Quantum Discharge",
                "Releases a burst of energy that deals substantial damage to opponents.",
                "attack",
                60,
                4),
            580,
            "rick.webp"),
        new Character(
            "Morty Smith",
            50,
            20,
            new Ability(
                "Temporal Shield",
                "Generates a protective shield that heals and protects the user.",
                "attack",
                60,
                4),
            400,
            "morty.webp"),
        new Character(
            "Peter Griffin",
            90,
            25,
            new Ability(
                "Titan Fist",
                "Delivers a crushing punch with immense power.",
                "attack",
                60,
                4),
            640,
            "peterGriffin.webp"),
      ],
      300);
  final Player playerTwo = new Player(
      'Player Two',
      [
        new Character(
            "Homer Simpson",
            80,
            15,
            new Ability(
                "Invigorating Surge",
                "Boosts the user's strength and stamina temporarily.",
                "attack",
                75,
                5),
            505,
            "homerSimpson.webp"),
        new Character(
            "Elsa",
            65,
            45,
            new Ability(
                "Frozen Barrage",
                "A flurry of ice projectiles that inflict significant damage.",
                "attack",
                60,
                4),
            665,
            "elsa.jpeg"),
        new Character(
            "Simba",
            70,
            35,
            new Ability(
                "Royal Roar",
                "A commanding roar that intimidates and damages foes.",
                "attack",
                60,
                4),
            605,
            "simba.jpeg"),
        new Character(
            "Woody",
            50,
            10,
            new Ability(
                "Sharpshooter's Precision",
                "A pinpoint attack that deals focused damage to the target.",
                "attack",
                60,
                4),
            300,
            "woody.webp"),
        new Character(
            "Darth Vader",
            100,
            50,
            new Ability(
                "Force Choke",
                "Uses the dark side of the Force to choke opponents.",
                "attack",
                60,
                4),
            905,
            "darthVader.jpg")
      ],
      600);
  Widget? gameOver = null;

  bool isPlayerOne = true;
  @override
  Widget build(BuildContext context) {
    final Player activePlayer = isPlayerOne ? playerOne : playerTwo;
    final Player inactivePlayer = isPlayerOne ? playerTwo : playerOne;
    return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/battlepageBackground.jpg'),
                fit: BoxFit.fitHeight)),
        child: gameOver is Widget
            ? gameOver
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Credit(inactivePlayer.credit)],
                  ),
                  OpponentRow(
                      inactivePlayer, setState, activePlayer, CheckEndGame),
                  PlayerRow(activePlayer, setState),
                  BottomUi(activePlayer, EndTurn, EndGame, inactivePlayer)
                ],
              ));
  }

  void EndTurn() {
    setState(() {
      isPlayerOne = !isPlayerOne;
      isPlayerOne ? playerOne.actionsLeft = 3 : playerTwo.actionsLeft = 3;
    });
  }

  void CheckEndGame(Player inactivePlayer) {
    bool noCardsInPlay = true;
    for (Character? card in inactivePlayer.cardsInPlay) {
      if (card is Character) noCardsInPlay = false;
    }

    if (noCardsInPlay) {
      bool noCardsInHand = true;
      for (Character? card in inactivePlayer.cardsInHand) {
        if (card is Character) noCardsInHand = false;
      }

      if (noCardsInHand) {
        EndGame(inactivePlayer.name);
      } else {
        int creditLeft = inactivePlayer.credit;
        int lowestCostCard = inactivePlayer.cardsInHand[0].point_cost;

        if (!noCardsInHand) {
          for (Character card in inactivePlayer.cardsInHand) {
            if (card.point_cost < lowestCostCard) {
              lowestCostCard = card.point_cost;
            }
            ;
          }
        }

        if (lowestCostCard > creditLeft) {
          EndGame(inactivePlayer.name);
        }
      }
    }
  }

  void EndGame(player) {
    setState(() {
      gameOver = new GameOverScreen(player);
    });
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
        color: Color.fromRGBO(111, 212, 255, 0.898),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        'Credit: ${creditLeft}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
              decoration: BoxDecoration(
                  boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(89, 245, 255, 135),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
                  border: Border.all(
                      width: 4, color: Color.fromRGBO(252, 255, 70, 0.5))))),
    );
  }
}

class OpponentRow extends StatelessWidget {
  final Player activePlayer;
  final Player inactivePlayer;
  final Function setState;
  final Function checkEndGame;
  const OpponentRow(
      this.inactivePlayer, this.setState, this.activePlayer, this.checkEndGame);

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = []; //
    for (var i = 0; i <= 4; i++) {
      if (inactivePlayer.cardsInPlay[i] is Character) {
        cardList.add(OpponentDragTarget(
            inactivePlayer: inactivePlayer,
            index: i,
            setState: setState,
            activePlayer: activePlayer,
            defender: inactivePlayer.cardsInPlay[i],
            checkEndGame: checkEndGame));
      } else {
        cardList.add(EmptyPosition());
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cardList,
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
        cardList.add(DraggablePlayerCard(
            player: player, character: player.cardsInPlay[i]));
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
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(88, 24, 24, 24),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
          color: Color.fromRGBO(0, 0, 0, 0.4),
          border: Border.all(color: Colors.white, width: 1)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: draggableCards),
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
  Player(this.name, this.cardsInHand, this.credit);
}

class InfoBar extends StatelessWidget {
  final Player inactivePlayer;
  final Function EndGame;
  final Function EndTurn;
  final Player activePlayer;
  const InfoBar(
      this.activePlayer, this.EndTurn, this.EndGame, this.inactivePlayer);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(children: [
          Credit(activePlayer.credit),
          SizedBox(width: 5),
          PlayerTurnInfo(activePlayer),
        ]),
        Row(
          children: [
            SurrenderBtn(EndGame, inactivePlayer),
            SizedBox(width: 5),
            EndTurnBtn(EndTurn)
          ],
        )
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
        color: const Color.fromARGB(228, 243, 255, 74),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        '${activePlayer.name}: ${activePlayer.actionsLeft} actions left',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class SurrenderBtn extends StatelessWidget {
  final Player inactivePlayer;
  final Function EndGame;
  const SurrenderBtn(this.EndGame, this.inactivePlayer);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 62, 62),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Container(
        height: 50,
        width: 200,
        child: TextButton(
          onPressed: () {
            EndGame(inactivePlayer.name);
          },
          child: Text(
            'Surrender',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class EndTurnBtn extends StatelessWidget {
  final Function EndTurn;
  const EndTurnBtn(this.EndTurn);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(228, 50, 104, 252),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Container(
        height: 50,
        width: 200,
        child: TextButton(
          onPressed: () {
            EndTurn();
          },
          child: Text(
            'End Turn :(',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class BottomUi extends StatelessWidget {
  final Player inactivePlayer;
  final Function EndGame;
  final Function EndTurn;
  final Player activePlayer;
  const BottomUi(this.activePlayer, this.EndTurn, this.EndGame,
      this.inactivePlayer); // remove {super.key}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoBar(activePlayer, EndTurn, EndGame, inactivePlayer),
        PlayerHand(activePlayer.cardsInHand)
      ],
    );
  }
}

class GameOverScreen extends StatelessWidget {
  final String winner;
  const GameOverScreen(this.winner);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${winner} was the winner!!',
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
          ElevatedButton(onPressed: () {}, child: Text('Home'))
        ],
      ),
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
    return DragTarget<DragData>(
      builder: (context, candidate, rejected) {
        return EmptyPosition();
      },
      onAcceptWithDetails: (value) {
        if (player.actionsLeft > 0) {
          var character = value.data.character;
          setState(() {
            player.cardsInPlay[index] = character;
            player.cardsInHand = player.cardsInHand.where((character) {
              return player.cardsInPlay[index] != character;
            }).toList();

            player.actionsLeft--;

            player.credit -= character!.point_cost;
          });
        }
      },
      onWillAcceptWithDetails: (value) {
        return value.data.cardtype == 'cardInHand';
      },
    );
  }
}

class DraggablePlayerCard extends StatelessWidget {
  const DraggablePlayerCard({
    super.key,
    required this.player,
    required this.character,
  });

  final Player player;
  final Character? character;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: new DragData('cardInPlay', character),
      child: BigCard(character),
      feedback: BigCard(character),
      childWhenDragging: EmptyPosition(),
    );
  }
}

class OpponentDragTarget extends StatelessWidget {
  const OpponentDragTarget(
      {super.key,
      required this.inactivePlayer,
      required this.activePlayer,
      required this.defender,
      required this.setState,
      required this.index,
      required this.checkEndGame});
  final Player inactivePlayer;
  final int index;
  final Function setState;
  final Player activePlayer;
  final Character? defender;
  final Function checkEndGame;

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragData>(
        builder: (context, candidateData, rejectedData) {
      return BigCard(defender);
    }, onWillAcceptWithDetails: (value) {
      return value.data.cardtype == 'cardInPlay';
    }, onAcceptWithDetails: (value) {
      if (activePlayer.actionsLeft > 0) {
        Character? attacker = value.data.character;
        setState(() {
          defender!.health -= attacker!.damage;
          activePlayer.actionsLeft--;
          if (defender!.health <= 0) {
            inactivePlayer.cardsInPlay[index] = null;
            checkEndGame(inactivePlayer);
          }
        });
      }
    });
  }
}

class CardHandDrag extends StatelessWidget {
  final Character character;
  const CardHandDrag(this.character); // removed super.key

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: new DragData('cardInHand', character),
      child: BigCard(character),
      feedback: BigCard(character),
      childWhenDragging: Container(),
    );
  }
}

class DragData {
  String cardtype;
  Character? character;
  DragData(this.cardtype, this.character);
}
