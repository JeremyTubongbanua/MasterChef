import 'dart:html';

import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:masterchef/screens/recipe_detail_screen.dart';
import 'package:masterchef/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class RecipesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = Provider.of<Recipes>(context, listen: false).recipes;

    return Scaffold(
        body: Center(
      child: Text('test'),
    ));
  }
}
