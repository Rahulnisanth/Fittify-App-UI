// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:fittify_ui/model/category_model.dart';
import 'package:fittify_ui/model/diet_model.dart';
import 'package:fittify_ui/model/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> populars = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDietModels() {
    diets = DietModel.getDiets();
  }

  void _getPopulars() {
    populars = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDietModels();
    _getPopulars();
    return Scaffold(
        appBar: appBar(),
        body: ListView(
          children: [
            _searchField(),
            const SizedBox(height: 30),
            _categoriesSection(),
            const SizedBox(height: 30),
            _dietSection(),
            const SizedBox(height: 30),
            _popularSection(),
            const SizedBox(height: 30),
          ],
        ));
  }

  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Popular Diets',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        ListView.separated(
            itemCount: populars.length,
            separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 115,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff1d1617).withOpacity(0.1),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      populars[index].icon,
                      height: 60,
                      width: 60,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          populars[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          populars[index].level +
                              " | " +
                              populars[index].duration +
                              " | " +
                              populars[index].calorie,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff7b6f72),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: populars[index].isSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff1d1617).withOpacity(0.3),
                              offset: Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: 0,
                            )
                          ]),
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('assets/icons/button.svg'),
                      ),
                    )
                  ],
                ),
              );
            })
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Select the Diet Modal',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
            height: 240,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                itemCount: diets.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: diets[index].color.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(diets[index].icon),
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          diets[index].level +
                              " | " +
                              diets[index].duration +
                              " | " +
                              diets[index].calorie,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff7b6f72),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: diets[index].isSelected
                                ? Colors.blue.shade400
                                : Colors.blue.shade200, // Background color
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12), // Button padding
                            elevation: 0.0, // Elevation for shadow effect
                          ),
                          onPressed: () {},
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
            height: 120,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20, right: 20),
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].color.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].icon),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1d1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search contents',
            hintStyle: const TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Filter.svg'),
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: const Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/dots.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}
