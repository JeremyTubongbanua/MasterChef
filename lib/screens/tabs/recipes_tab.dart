import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:masterchef/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class RecipesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = Provider.of<Recipes>(context, listen: false).recipes;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.orange),
            child: Text('SEARCH BAR'),
          ),
          Expanded(
            // height: 500,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
              itemBuilder: (context, index) {
                return RecipeCard(recipes[index]);
              },
              itemCount: recipes.length,
            ),
          )
        ],
      ),
    );
  }
}
