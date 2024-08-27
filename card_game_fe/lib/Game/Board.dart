import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 89, 106, 120)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Gold()],
            ),
            OpponentRow(),
            PlayerRow(),
            BottomUi()
          ],
        ));
  }
}

class Gold extends StatelessWidget {
  const Gold({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown,
      ),
      child: Text(
        'Gold:7000',
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
      child: Placeholder(),
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
  const PlayerRow({super.key});

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

class PlayerHand extends StatelessWidget {
  const PlayerHand({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        ),
         SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        ),
         SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        ),
         SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        ),
         SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        ),
        SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        ),
         SizedBox(
          height: 100,
          width: 80,
          child: Placeholder(),
        )
      ],
    );
  }
}

class InfoBar extends StatelessWidget {
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Gold(),
        PlayerTurnInfo(), // to do
        SurrenderBtn(), // to do
        EndTurnBtn() // to do
      ],
    ));
  }
}

class PlayerTurnInfo extends StatelessWidget {
  const PlayerTurnInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 14, 64, 110),
      ),
      child: Text(
        'Player 1: 2 actions left',
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
      child: Text(
        'Surrender!!:(',
        style: TextStyle(fontSize: 18),
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
        color: const Color.fromARGB(255, 160, 37, 37),
      ),
      child: Text(
        'Gold:7000',
        style: TextStyle(fontSize: 18),
      ),
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
  }
}

class BottomUi extends StatelessWidget {
  const BottomUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [InfoBar(), PlayerHand()],
    );
  }
}
