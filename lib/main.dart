import 'package:flutter/material.dart';
import 'package:masterchef/providers/recipes.dart';
import 'package:masterchef/screens/login_screen.dart';
import 'package:masterchef/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  final MaterialApp app = MaterialApp(
    theme: ThemeData(
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(255, 36, 0, 1),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white60,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(255, 36, 0, 1),
        ),
      ),
    ),
    routes: {
      '/': (ctx) => TabsScreen(),
    },
  );
  final MultiProvider providers = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Recipes()),
    ],
    child: app,
  );
  runApp(providers);
}
