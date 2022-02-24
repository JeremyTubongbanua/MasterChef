import 'package:flutter/material.dart';
import 'package:masterchef/screens/tabs_screen.dart';

void main() {
  final ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red, accentColor: Colors.amber),
    textTheme: TextTheme(
      headline6: TextStyle(fontFamily: 'Quicksand'),
      bodyText2: TextStyle(fontFamily: 'Quicksand'),
    ),
  );
  final MaterialApp app = MaterialApp(
    theme: theme,
    routes: {
      '/': (ctx) => TabsScreen(),
    },
  );
  runApp(app);
}
