import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 300,
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
              padding: const EdgeInsets.all(10),
              height: 40,
              child: Text(recipe.name),
            ),
          ],
        ),
      ),
    );
  }
}
