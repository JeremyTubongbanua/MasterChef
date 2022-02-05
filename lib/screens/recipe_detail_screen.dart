import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const String routeName = '/recipe-details';

  const RecipeDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterChef', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [],
      ),
    );
  }
}
