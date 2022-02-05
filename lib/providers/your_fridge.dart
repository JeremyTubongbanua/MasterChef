import 'package:flutter/cupertino.dart';

class YourFridge with ChangeNotifier {
  final List<Map<String, dynamic>> ingredients = [
    {
      'name': 'Flour',
      'amount': 2,
    },
    {
      'name': 'Eggs',
      'amount': 12,
    },
    {
      'name': 'Olive Oil',
      'amount': 1,
    },
    {
      'name': 'Butter',
      'amount': 1,
    }
  ];

  void addIngredient(String name, double amount) {
    ingredients.add({'name': name, 'amount': amount});
    notifyListeners();
  }

  void removeIngredient(String name) {
    ingredients.removeWhere((element) => element['name'] == name);
    notifyListeners();
  }
}
