class PopularDietsModel {
  String name;
  String icon;
  String level;
  String duration;
  String calorie;
  bool isSelected;

  PopularDietsModel(
      {required this.name,
      required this.icon,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.isSelected});

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(PopularDietsModel(
      name: 'Blueberry Pancake',
      icon: 'assets/icons/blueberry-pancake.svg',
      level: 'Medium',
      duration: '30mins',
      calorie: '230kCal',
      isSelected: true,
    ));

    popularDiets.add(PopularDietsModel(
      name: 'Salmon Nigiri',
      icon: 'assets/icons/salmon-nigiri.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '120kCal',
      isSelected: false,
    ));

    return popularDiets;
  }
}
