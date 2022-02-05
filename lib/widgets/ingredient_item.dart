import 'package:flutter/material.dart';
import 'package:masterchef/providers/your_fridge.dart';
import 'package:provider/provider.dart';

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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${amount.toString()} x ${' ' * (4 - amount.toString().length)}',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: Colors.black54)),
              IconButton(
                  onPressed: () {
                    Provider.of<YourFridge>(context, listen: false).removeIngredient(name);
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }
}
