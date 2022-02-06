import 'package:flutter/cupertino.dart';

class YourFridge with ChangeNotifier {
  final List<Map<String, dynamic>> _ingredients = [
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
    },
    {
      'name': 'Tomatoes',
      'amount': 10,
    },
    {
      'name': 'Lettuce',
      'amount': 10,
    },
    {
      'name': 'Whipped Cream (g)',
      'amount': 1000,
    },
    {
      'name': 'Vanilla Bean',
      'amount': 5,
    },
    {
      'name': 'Sugar (g)',
      'amount': 90,
    },
    {
      'name': 'Egg Yolks (g)',
      'amount': 90,
    },
    {
      'name': 'Salt (g)',
      'amount': 1,
    },
  ];

  void addIngredient(String name, double amount) {
    int index = _ingredients.indexWhere((element) => element['name'].toString().toLowerCase() == name.toLowerCase());
    if (index == -1) {
      _ingredients.add({'name': name, 'amount': amount});
    } else {
      _ingredients[index]['amount'] += amount;
    }
    notifyListeners();
  }

  void removeIngredient(String name) {
    _ingredients.removeWhere((element) => element['name'] == name);
    notifyListeners();
  }

  void removeIngredientAmount(String name, double amount) {
    int index = _ingredients.indexWhere((element) => element['name'] == name);
    if (index > 0) {
      int checkAmount = _ingredients[index]['amount'];
      // print(amount - checkAmount);
      if (checkAmount - amount < 0) {
        removeIngredient(name);
      } else {
        _ingredients[index]['amount'] -= amount;
      }
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> get fridge {
    return [..._ingredients];
  }
}
