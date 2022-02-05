import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';

class Recipes with ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
      'Salad',
      'https://images.pexels.com/photos/4198024/pexels-photo-4198024.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Jeremy',
      [5],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
    Recipe(
      'Sausages',
      'https://images.pexels.com/photos/8021124/pexels-photo-8021124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Mr Bean',
      [5, 4],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
    Recipe(
      'Grilled Steak',
      'https://images.pexels.com/photos/7616677/pexels-photo-7616677.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'Matthew',
      [3],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
    Recipe(
      'Lemon Water',
      'https://images.pexels.com/photos/1021756/pexels-photo-1021756.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Chris',
      [3],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
    Recipe(
      'Noodles',
      'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-fotios-1279330.jpg&fm=jpg',
      'CJ',
      [3],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
    Recipe(
      'Sausages 2.0',
      'https://images.pexels.com/photos/8021124/pexels-photo-8021124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Josh',
      [5, 4, 2],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
    Recipe(
      'Noodles 3.0',
      'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-fotios-1279330.jpg&fm=jpg',
      'Henry',
      [3, 5],
      [
        {
          'name': 'flour',
          'amount': 2,
        }
      ],
    ),
  ];

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
  }

  get recipes {
    return [..._recipes];
  }
}
