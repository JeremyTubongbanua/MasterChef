import 'package:flutter/material.dart';

class YourRecipes with ChangeNotifier {
  final List<String> _recipeIds = [];

  void addRecipeId(String id) {
    _recipeIds.add(id);
    notifyListeners();
  }

  void removeRecipeId(String id) {
    _recipeIds.remove(id);
    notifyListeners();
  }

  void toggleRecipeId(String id) {
    if (_recipeIds.contains(id)) {
      removeRecipeId(id);
    } else {
      addRecipeId(id);
    }
  }

  List<String> get recipeIds {
    return [..._recipeIds];
  }
}
