import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';

class Recipes with ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe('Salad', 'https://images.pexels.com/photos/4198024/pexels-photo-4198024.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Recipe('Sausages', 'https://images.pexels.com/photos/8021124/pexels-photo-8021124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
    Recipe('Steak', 'https://images.pexels.com/photos/7616677/pexels-photo-7616677.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'),
  ];

  void addRecipe(Recipe recipe) {
    this._recipes.add(recipe);
  }

  get recipes {
    return [..._recipes];
  }
}
