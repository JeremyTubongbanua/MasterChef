import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:masterchef/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const String routeName = '/recipe-details';

  const RecipeDetailScreen();

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
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
                      Text(
                        recipe.name,
                        style: TextStyle(fontSize: 48),
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
                      Divider(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Text(
                            'Ingredients',
                            style: TextStyle(fontSize: 24),
                          ),
                          ...recipe.ingredients.map((ingredientInfo) => Text('${ingredientInfo['name']}: x${ingredientInfo['amount']}')).toList()
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // body: Container(
      //   height: 800,
      //   child: Stack(
      // children: [
      //   Image.network(
      //     recipe.imageUrl,
      //     width: double.infinity,
      //     fit: BoxFit.cover,
      //     loadingBuilder: (context, child, loadingProgress) {
      //       if (loadingProgress == null) return child;
      //       return const Center(child: CircularProgressIndicator());
      //     },
      //   ),
      //   Positioned(
      //     top: 50,
      //     left: 50,
      //     child: Card(
      //       child: Text('test'),
      //     ),
      //   )
      // ],
      //   ),
      // ),
    );
  }
}
