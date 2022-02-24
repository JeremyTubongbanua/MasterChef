import 'package:flutter/material.dart';

class YourFridgeTab extends StatelessWidget {
  const YourFridgeTab();

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.background,
      body: Center(
        child: Text('Your Fridge', style: TextStyle(fontFamily: 'Quicksand')),
      ),
    );
  }
}
