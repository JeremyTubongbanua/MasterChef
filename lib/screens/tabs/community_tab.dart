import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:masterchef/screens/add_recipe_screen.dart';
import 'package:masterchef/screens/recipe_detail_screen.dart';
import 'package:masterchef/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class CommunityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = Provider.of<Recipes>(context).recipes;

    return Column(
      children: [
        // Container(
        //   width: double.infinity,
        //   decoration: BoxDecoration(color: Colors.orange),
        //   child: Text('SEARCH BAR'),
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                // childAspectRatio: 2 / 1,
                maxCrossAxisExtent: 400,
                // mainAxisExtent: 2,
                // mainAxisSpacing: 25,
                // crossAxisSpacing: 25,
              ),
              itemBuilder: (context, index) {
                if (index == recipes.length) {
                  return InkWell(
                    onTap: () async {
                      await Navigator.of(context).pushNamed(AddRecipeScreen.routeName);
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.black54),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  );
                }
                return InkWell(
                  onTap: () async {
                    // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Why hello there')));
                    await Navigator.of(context).pushNamed(RecipeDetailScreen.routeName, arguments: recipes[index]);
                  },
                  child: RecipeCard(recipes[index]),
                );
              },
              itemCount: recipes.length + 1,
            ),
          ),
        ),
      ],
    );
  }
}
