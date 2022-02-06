import 'dart:html';

import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:masterchef/providers/your_recipes.dart';
import 'package:masterchef/screens/recipe_detail_screen.dart';
import 'package:masterchef/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class RecipesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> recipeIds = Provider.of<YourRecipes>(context).recipeIds;
    final Recipes recipesContainer = Provider.of<Recipes>(context);

    final List<Recipe> recipes = recipeIds.map((recipeId) => recipesContainer.getRecipe(recipeId)).toList();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: recipes.length == 0
            ? Center(
                child: Text('Go to Community and favorite some recipes!'),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  // childAspectRatio: 2 / 1,
                  maxCrossAxisExtent: 400,
                  // mainAxisExtent: 2,
                  // mainAxisSpacing: 25,
                  // crossAxisSpacing: 25,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Why hello there')));
                      await Navigator.of(context).pushNamed(RecipeDetailScreen.routeName, arguments: recipes[index]);
                    },
                    child: RecipeCard(recipes[index]),
                  );
                },
                itemCount: recipes.length,
              ),
      ),
    );
  }
}
