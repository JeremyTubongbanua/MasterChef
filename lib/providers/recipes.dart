import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';

class Recipes with ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
      'Vanilla Creme Brulee',
      'https://images.pexels.com/photos/96582/pexels-photo-96582.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Robert',
      [
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        4,
        3
      ],
      [
        {
          'name': 'Whipped Cream (g)',
          'amount': 500,
        },
        {
          'name': 'Vanilla Bean',
          'amount': 1,
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
      ],
      [
        '1. Combine cream and vanilla bean and scalf',
        '2. In a separate bowl, combine sugar, salt, and egg yolks and whisk until smooth',
        '3. Temper egg mixture with hot cream, stir',
        '4. Strain through a fine mesh chinois',
        '5. Portion into cups',
        '6. Bake in a bain-marie in roasted pan at 160 C for approx. 35min tightly covered with foil until just set',
        '7. After baking, let rest room temperature the Creme Brulee until water is cold. Remove from pan and let rest in fridge overnight.',
        '8. The day after or when creme is very cold, caramelize the surface with a torch or using the broiler oven.',
        '9. Caramelization: Sprinkle think layer of brown sugar on top of creme, then \"burn/caramelize\", redo a second time to create a thin crust.',
      ],
    ),
    Recipe(
      'Salad',
      'https://images.pexels.com/photos/4198024/pexels-photo-4198024.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Jeremy',
      [5, 4, 4, 4, 4, 4, 2, 1, 5, 5, 5, 5],
      [
        {
          'name': 'Lettuce',
          'amount': 1,
        },
        {
          'name': 'Tomatoes',
          'amount': 2,
        },
      ],
      [
        '1. Cut lettuce',
        '2. Cut tomatoes',
        '3. Put it in a bowl',
        '4. Enjoy',
      ],
    ),
    Recipe(
      'Eggs',
      'https://images.pexels.com/photos/6846030/pexels-photo-6846030.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Jeremy',
      [5, 1, 1, 1, 5, 1, 1, 1, 1, 1, 1],
      [
        {
          'name': 'Eggs',
          'amount': 2,
        },
        {
          'name': 'Butter',
          'amount': 1,
        },
      ],
      [
        '1. Frying pan to medium heat',
        '2. Put butter on frying pan',
        '3. Put eggs on frying pan',
        '4. Flip after 2-3 minutes',
        '5. Enjoy',
      ],
    ),
    Recipe(
      'Sausages',
      'https://images.pexels.com/photos/8021124/pexels-photo-8021124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Josh',
      [5, 4],
      [
        {
          'name': 'Sausages',
          'amount': 2,
        },
        {
          'name': 'Olive Oil',
          'amount': 1,
        }
      ],
      [
        '1. Frying pan to medium heat',
        '2. Let the pan get hot',
        '3. Put olive oil and let it sit for 1-2 minutes',
        '4. Put sausages in the frying pan and flip when necessary',
        '5. Take it out when the sausages change color',
        '6. Enjoy!'
      ],
    ),
    Recipe(
      'Grilled Steak',
      'https://images.pexels.com/photos/7616677/pexels-photo-7616677.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      'Matthew',
      [
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
      ],
      [
        {
          'name': 'Steak',
          'amount': 2,
        },
      ],
      [
        '1. Put the steak on the grill',
        '2. Flip',
        '3. Enjoy',
      ],
    ),
    Recipe(
      'Lemon Water',
      'https://images.pexels.com/photos/1021756/pexels-photo-1021756.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Chris',
      [
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
        5,
      ],
      [
        {
          'name': 'Water',
          'amount': 1,
        },
        {
          'name': 'Lemon',
          'amount': 1,
        }
      ],
      [
        '1. Pour water into your cup',
        '2. Cut a slice of lemon',
        '3. Throw it into your cup (only works if you throw it)',
        '4. Take a sip. MMMMMMMMMM',
      ],
    ),
    Recipe(
      'Noodles',
      'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-fotios-1279330.jpg&fm=jpg',
      'CJ',
      [3],
      [
        {
          'name': 'Flour',
          'amount': 2,
        },
        {
          'name': 'Water',
          'amount': 1,
        },
        {
          'name': 'Noodles',
          'amount': 1,
        },
      ],
      [
        '1. Do the thing',
        '2. Enjoy',
      ],
    ),
    Recipe(
      'Sausages 2.0',
      'https://images.pexels.com/photos/8021124/pexels-photo-8021124.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'Josh',
      [5, 4, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1],
      [
        {
          'name': 'Sausages',
          'amount': 4,
        }
      ],
      [
        '1. Do the thing',
        '2. Enjoy',
      ],
    ),
    Recipe(
      'Noodles 3.0',
      'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?cs=srgb&dl=pexels-lisa-fotios-1279330.jpg&fm=jpg',
      'Henry',
      [3, 5],
      [
        {
          'name': 'Noodles',
          'amount': 3,
        }
      ],
      [
        '1. Do the thing',
        '2. Enjoy',
      ],
    ),
  ];

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  List<Recipe> get recipes {
    return [..._recipes];
  }

  Recipe getRecipe(String id) {
    return _recipes.firstWhere((element) => element.id == id);
  }
}
