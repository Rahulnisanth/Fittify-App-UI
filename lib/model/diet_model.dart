import 'package:flutter/material.dart';

class DietModel {
  String name;
  String icon;
  String level;
  String duration;
  String calorie;
  Color color;
  bool isSelected;

  DietModel(
      {required this.name,
      required this.icon,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.color,
      required this.isSelected});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: 'Honey Pancake',
        icon: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180kCal',
        isSelected: true,
        color: Color(0xff9DCEFF)));

    diets.add(DietModel(
        name: 'Canai Bread',
        icon: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230kCal',
        isSelected: false,
        color: Color(0xffEEA4CE)));

    return diets;
  }
}
