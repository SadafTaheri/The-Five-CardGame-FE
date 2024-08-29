import 'dart:convert';

import 'package:flutter/material.dart';
import './BigCardRender.dart';
import 'package:http/http.dart' as http;

class BigCard extends StatelessWidget {
  final Character? character;
  const BigCard(this.character);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: BigCardRender(
          cardCost: character!.point_cost.toString(),
          image_url: character!.imageURL,
          characterName: character!.name,
          ability: character!.ability,
          health: character!.health.toString(),
          damage: character!.damage.toString()),
    );
  }
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

class CharacterMapped {
  String name;
  String health;
  String damage;
  AbilityMapped ability;
  String point_cost;
  String image_url;
  CharacterMapped({
    required this.name,
    required this.health,
    required this.damage,
    required this.ability,
    required this.point_cost,
    required this.image_url,
  });
  factory CharacterMapped.fromMap(Map<String, dynamic> map) {
    return CharacterMapped(
      name: map['name'],
      health: map['health'].toString(),
      damage: map['damage'].toString(),
      ability: AbilityMapped.fromMap(map['ability']),
      point_cost: map['point_cost'].toString(),
      image_url: map['image_url'],
    );
  }
}

class AbilityMapped {
  String name;
  String description;
  String type;
  String strength;
  String ability_cost;
  AbilityMapped(
      {required this.name,
      required this.description,
      required this.type,
      required this.strength,
      required this.ability_cost});
  factory AbilityMapped.fromMap(Map<String, dynamic> map) {
    return AbilityMapped(
      name: map['name'],
      description: map['description'],
      type: map['type'],
      strength: map['strength'].toString(),
      ability_cost: map['ability_cost'].toString(),
    );
  }
}
