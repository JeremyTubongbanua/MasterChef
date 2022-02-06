import 'package:flutter/material.dart';
import 'package:masterchef/providers/your_fridge.dart';
import 'package:masterchef/widgets/ingredient_item.dart';
import 'package:provider/provider.dart';

class YourFridgeTab extends StatelessWidget {
  const YourFridgeTab();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final YourFridge fridgeContainer = Provider.of<YourFridge>(context);
    final List<Map<String, dynamic>> fridge = fridgeContainer.fridge;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 500,
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(label: Text('Name')),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: amountController,
                        decoration: const InputDecoration(label: Text('Amount (optional)')),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        fridgeContainer.addIngredient(nameController.text, double.parse(amountController.text == '' ? 1.0.toString() : amountController.text));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 0,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12.0),
            child: const Text(
              'Your Fridge',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 500,
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (ctx, index) {
                final String name = fridge[index]['name'];
                final double amount = fridge[index]['amount'];
                return IngredientItem(name, amount);
              },
              itemCount: fridge.length,
            ),
          )
        ],
      ),
    );
  }
}
