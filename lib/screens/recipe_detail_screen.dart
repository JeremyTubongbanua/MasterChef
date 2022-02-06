import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:masterchef/providers/your_fridge.dart';
import 'package:masterchef/providers/your_recipes.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const String routeName = '/recipe-details';

  const RecipeDetailScreen();

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    final YourRecipes yourRecipesContainer = Provider.of<YourRecipes>(context);
    final YourFridge fridgeContainer = Provider.of<YourFridge>(context);
    final List<Map<String, dynamic>> assessment = recipe.getAssessment(fridgeContainer.fridge);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                recipe.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.20,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 800,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recipe.name,
                            style: TextStyle(fontSize: 48),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<YourRecipes>(context, listen: false).toggleRecipeId(recipe.id);
                            },
                            icon: yourRecipesContainer.recipeIds.contains(recipe.id) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                            iconSize: 48,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('By ${recipe.author}'),
                          Row(
                            children: [
                              Container(
                                child: RatingBarIndicator(
                                  rating: recipe.averageRating,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 25.0,
                                  direction: Axis.horizontal,
                                ),
                              ),
                              Text(' ${recipe.ratings.length} ratings'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(
                        height: 16,
                      ),
                      SizedBox(height: 20),
                      buildIngredientsList(assessment),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Instructions',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            // ...recipe.ingredients.map((ingredientInfo) => Text('${ingredientInfo['name']}: x${ingredientInfo['amount']}')).toList(),
                            SizedBox(
                              height: 15,
                            ),
                            ...recipe.steps.map((step) => Text(step)).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text('\"Making\" this recipe will remove all the required ingredients from your fridge.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  for (int i = 0; i < assessment.length; i++) {
                                    final String name = assessment[i]['name'];
                                    final double amount = assessment[i]['need'];
                                    fridgeContainer.removeIngredientAmount(name, amount);
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Made?')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildIngredientsList(List<Map<String, dynamic>> assessment) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          // ...recipe.ingredients.map((ingredientInfo) => Text('${ingredientInfo['name']}: x${ingredientInfo['amount']}')).toList(),
          SizedBox(
            height: 30,
          ),
          ...assessment
              .map(
                (ingredientInfo) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${ingredientInfo['name']}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${ingredientInfo['have']}/${ingredientInfo['need']}',
                          style: TextStyle(
                            fontSize: 18,
                            color: ingredientInfo['have'] >= ingredientInfo['need'] ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
