import 'package:flutter/material.dart';
import 'package:masterchef/models/recipe.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:provider/provider.dart';

class AddRecipeScreen extends StatefulWidget {
  static const String routeName = '/add-recipe';

  const AddRecipeScreen();

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final List<Map<String, dynamic>> ingredients = [];
  final List<String> steps = [];
  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController recipeNameControler = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController instructionLineController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('MasterChef', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        width: size.width,
        height: size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                'General Information',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                height: 80,
                child: TextField(
                  controller: recipeNameControler,
                  decoration: InputDecoration(label: Text('Recipe Name')),
                ),
              ),
              Container(
                height: 80,
                child: TextField(
                  controller: authorController,
                  decoration: InputDecoration(label: Text('Author')),
                ),
              ),
              Container(
                height: 80,
                child: TextField(
                  controller: imageUrlController,
                  decoration: InputDecoration(label: Text('Image URL')),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add Ingredients',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ingredients
                        .map((ingredientInfo) => Card(
                            elevation: 10,
                            // child: Text('${ingredientInfo['name']} ${ingredientInfo['amount']}'),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 200,
                                  child: Text('${ingredientInfo['name']}'),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 200,
                                  child: Text('${ingredientInfo['amount']}'),
                                ),
                              ],
                            )))
                        .toList(),
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextField(controller: ingredientController, decoration: InputDecoration(label: Text('Ingredient Name'))),
                      ),
                      Expanded(
                        child: TextField(controller: amountController, decoration: InputDecoration(label: Text('Amount'))),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              ingredients.add({'name': ingredientController.text, 'amount': double.parse(amountController.text)});
                              ingredientController.text = '2';
                              amountController.text = '2';
                              ingredientController.clear();
                              amountController.clear();
                            });
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add Steps',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: steps
                        .map((step) => Container(
                              width: size.width * 0.7,
                              child: Card(
                                elevation: 10,
                                // child: Text('${ingredientInfo['name']} ${ingredientInfo['amount']}'),
                                child: Text('${step}'),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextField(controller: instructionLineController, decoration: InputDecoration(label: Text('Step Description'))),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              steps.add(instructionLineController.text);
                            });
                            instructionLineController.clear();
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final Recipe recipe = Recipe(
                      recipeNameControler.text,
                      imageUrlController.text,
                      authorController.text,
                      [5],
                      ingredients,
                      steps,
                    );
                    setState(() {
                      Provider.of<Recipes>(context, listen: false).addRecipe(recipe);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Finish',
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
