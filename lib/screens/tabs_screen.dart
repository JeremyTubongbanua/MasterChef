import 'package:flutter/material.dart';
import 'package:masterchef/screens/tabs/community_tab.dart';
import 'package:masterchef/screens/tabs/settings_tab.dart';
import 'package:masterchef/screens/tabs/your_fridge_tab.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> tabs = [
    {
      'name': 'Your Fridge',
      'icondata': Icons.food_bank_outlined,
      'tabscreen': YourFridgeTab(),
    },
    {
      'name': 'Community',
      'icondata': Icons.school,
      'tabscreen': CommunityTab(),
    },
    {
      'name': 'Settings',
      'icondata': Icons.settings,
      'tabscreen': SettingsTab(),
    },
  ];

  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.primary,
        elevation: 0,
        title: Text(
          'MasterChef',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: tabs[_currentIndex]['tabscreen'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: cs.primary,
        selectedItemColor: cs.onPrimary,
        items: tabs
            .map((tabInfo) => BottomNavigationBarItem(
                  label: tabInfo['name'],
                  icon: Icon(tabInfo['icondata']),
                ))
            .toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
