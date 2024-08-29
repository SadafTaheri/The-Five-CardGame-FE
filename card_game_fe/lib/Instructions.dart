import 'package:flutter/material.dart';

class Instructions extends StatefulWidget {
  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  var _instructionBtn = 0;
  @override
  Widget build(BuildContext context) {
    var activeColor = Colors.blueGrey;
    var inactiveColor = Colors.purpleAccent;
    Widget bodyHolder;
    switch (_instructionBtn) {
      case 0:
        bodyHolder = HowToPlay();
        break;
      case 1:
        bodyHolder = CollectCardInfo();
        break;
      case 2:
        bodyHolder = Placeholder();
        break;
      default:
        bodyHolder = CollectCardInfo();
        break;
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            opacity: 0.9,
            image: AssetImage("lib/assets/space.jpeg"),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(50, 50, 50, 0.9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: _instructionBtn == 0
                                ? activeColor
                                : inactiveColor),
                        onPressed: () {
                          setState(() {
                            _instructionBtn = 0;
                          });
                        },
                        child: Text('How to play??',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo))),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: _instructionBtn == 1
                                ? activeColor
                                : inactiveColor),
                        onPressed: () {
                          setState(() {
                            _instructionBtn = 1;
                          });
                        },
                        child: Text('Collect Cards',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo))),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: _instructionBtn == 2
                                ? activeColor
                                : inactiveColor),
                        onPressed: () {
                          setState(() {
                            _instructionBtn = 2;
                          });
                        },
                        child: Text('more',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo)))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(100, 100, 100, 0.9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: bodyHolder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CollectCardInfo extends StatelessWidget {
  const CollectCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Collect Cards',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Text(
          "The time had come for Nancy to say goodbye. She had been dreading this moment for a good six months, and it had finally arrived despite her best efforts to forestall it. No matter how hard she tried, she couldn't keep the inevitable from happening. So the time had come for a normal person to say goodbye and move on. It was at this moment that Nancy decided not to be a normal person. After all the time and effort she had expended, she couldn't bring herself to do it.",
          style: TextStyle(
              fontSize: 24, color: const Color.fromARGB(255, 249, 248, 248)),
        ),
      ],
    );
  }
}

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How to Play',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(
          'Objective:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'The goal of the game is to outmaneuver your opponent by strategically playing cards, attacking, defending, and utilizing abilities. The game ends when a player cannot make any moves due to insufficient gold or no cards on the board.',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 249, 248, 248),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Game Setup:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Each player starts with a deck of up to 15 cards.\nGold is finite and is decided during the game setup, which is used to play cards.',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 249, 248, 248),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Turn Structure:',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Each player has 3 actions per turn:\n- **Play Card:** Spend gold to play a card from your hand to the board.\n- **Attack with Card:** Use a card on the board to attack an opponent\'s card.\n- **Use an Ability:** Activate a special ability from a card on the board.',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 249, 248, 248),
          ),
        ),
      ],
    );
  }
}

class More extends StatelessWidget {
  const More({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('MOre',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Text(
          "The time had come for Nancy to say goodbye. She had been dreading this moment for a good six months, and it had finally arrived despite her best efforts to forestall it. No matter how hard she tried, she couldn't keep the inevitable from happening. So the time had come for a normal person to say goodbye and move on. It was at this moment that Nancy decided not to be a normal person. After all the time and effort she had expended, she couldn't bring herself to do it.",
          style: TextStyle(
              fontSize: 24, color: const Color.fromARGB(255, 249, 248, 248)),
        ),
      ],
    );
  }
}


// Using space.jpeg as background image on 0.9 opacity :)  