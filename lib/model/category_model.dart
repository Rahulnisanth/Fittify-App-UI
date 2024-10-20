import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String icon;
  Color color;

  CategoryModel({required this.name, required this.icon, required this.color});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(
        name: 'Salad',
        icon: 'assets/icons/plate.svg',
        color: Color(0xff9DCEFF)));

    categories.add(CategoryModel(
        name: 'Cake',
        icon: 'assets/icons/pancakes.svg',
        color: Color(0xffEEA4CE)));

    categories.add(CategoryModel(
        name: 'Pie', icon: 'assets/icons/pie.svg', color: Color(0xff9DCEFF)));

    categories.add(CategoryModel(
        name: 'Smoothies',
        icon: 'assets/icons/orange-snacks.svg',
        color: Color(0xffEEA4CE)));
    return categories;
  }
}
