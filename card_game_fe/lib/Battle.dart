import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Battle extends StatefulWidget {
  @override
  _BattleState createState() => _BattleState();
}

class _BattleState extends State<Battle> {
  String _description = "Hover over a difficulty to see its details.";
  String _cost = "";
  List<String> _decks = [];
  String _selectedDeck = '';

  @override
  void initState() {
    super.initState();
    _loadDecksFromBackend();
  }

  Future<void> _loadDecksFromBackend() async {
    final response = await http
        .get(Uri.parse('https://the-five-card-game-be.onrender.com/decks'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      setState(() {
        _decks = data.map((deck) => deck['name'] as String).toList();
        if (_decks.isNotEmpty) {
          _selectedDeck = _decks[0];
        }
      });
    } else {
      throw Exception('Failed to load decks from backend');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battle'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                "lib/assets/space.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: Dropdown and Difficulty Buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown for selecting the deck
                    DeckDropdown(
                      decks: _decks,
                      selectedDeck: _selectedDeck,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedDeck = newValue!;
                        });
                      },
                    ),
                    SizedBox(height: 40),
                    // Buttons for selecting game difficulty
                    DifficultyButton(
                      label: 'Easy Game',
                      color: Colors.green,
                      onHover: () {
                        setState(() {
                          _description =
                              "Easy Game: A relaxed pace with fewer enemies.";
                          _cost = "Cost: 10 coins";
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    DifficultyButton(
                      label: 'Medium Game',
                      color: Colors.orange,
                      onHover: () {
                        setState(() {
                          _description =
                              "Medium Game: Balanced difficulty with moderate challenges.";
                          _cost = "Cost: 20 coins";
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    DifficultyButton(
                      label: 'Hard Game',
                      color: Colors.red,
                      onHover: () {
                        setState(() {
                          _description =
                              "Hard Game: Intense difficulty with powerful enemies.";
                          _cost = "Cost: 30 coins";
                        });
                      },
                    ),
                    SizedBox(height: 40),
                    // Play button at the bottom
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Play',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                // Description Box
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          _cost,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeckDropdown extends StatelessWidget {
  final List<String> decks;
  final String selectedDeck;
  final ValueChanged<String?> onChanged;

  const DeckDropdown({
    Key? key,
    required this.decks,
    required this.selectedDeck,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedDeck,
      dropdownColor: Colors.black,
      iconEnabledColor: Colors.white,
      items: decks.map((String deck) {
        return DropdownMenuItem<String>(
          value: deck,
          child: Text(deck, style: TextStyle(color: Colors.white)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class DifficultyButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onHover;

  const DifficultyButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onHover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onHover(),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 200,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
