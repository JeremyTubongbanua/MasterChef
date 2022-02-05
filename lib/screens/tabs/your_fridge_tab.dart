import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:masterchef/providers/your_fridge.dart';
import 'package:masterchef/widgets/ingredient_item.dart';
import 'package:provider/provider.dart';

class YourFridgeTab extends StatelessWidget {
  const YourFridgeTab();

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final List<Map<String, dynamic>> fridge = Provider.of<YourFridge>(context).ingredients;

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
                        decoration: InputDecoration(label: Text('Name')),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: amountController,
                        decoration: InputDecoration(label: Text('Amount')),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 0,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
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
