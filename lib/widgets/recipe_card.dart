import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/your_fridge.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> fridge = Provider.of<YourFridge>(context).fridge;
    final List<Map<String, dynamic>> assessment = recipe.getAssessment(fridge);
    bool yellow = false;
    for (int i = 0; i < assessment.length; i++) {
      final String name = assessment[i]['name'];
      final double have = assessment[i]['have'];
      final double need = assessment[i]['need'];
      if (have < need) {
        yellow = true;
        break;
      }
    }
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 1000,
                child: Image.network(
                  recipe.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(recipe.name),
                      Text(
                        'By: ${recipe.author}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: recipe.averageRating,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 10.0,
                            direction: Axis.horizontal,
                          ),
                          Text(' ${recipe.ratings.length}', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Can Make: ',
                            style: TextStyle(fontSize: 12),
                          ),
                          yellow
                              ? Icon(
                                  Icons.dangerous_outlined,
                                  color: Colors.orange,
                                )
                              : Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
