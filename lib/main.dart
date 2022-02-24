import 'package:flutter/material.dart';
import 'package:masterchef/screens/tabs_screen.dart';

void main() {
  ThemeData theme = ThemeData();

  theme = theme.copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xffb8f2e6),
      onPrimary: Colors.black,
      secondary: Color(0xffaed9e0),
      onSecondary: Colors.black,
      background: Color(0xffebffff),
      onBackground: Colors.black,
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline6: TextStyle(fontSize: 24, fontFamily: 'Quicksand'), // title
      bodyText2: TextStyle(fontSize: 12, fontFamily: 'Quicksand'), // body text
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
