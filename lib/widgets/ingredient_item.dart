import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String name;
  final double amount;

  const IngredientItem(
    this.name,
    this.amount,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(amount.toString()),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ],
      ),
    );
  }
}
