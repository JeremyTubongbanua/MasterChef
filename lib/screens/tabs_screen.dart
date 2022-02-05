import 'package:flutter/material.dart';
import 'package:masterchef/screens/tabs/community_tab.dart';
import 'package:masterchef/screens/tabs/recipes_tab.dart';
import 'package:masterchef/screens/tabs/settings_tab.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late int _currentIndex;

  final List<Map<String, dynamic>> pages = [
    {
      'name': 'Recipes',
      'icondata': Icons.book,
      'tabwidget': RecipesTab(),
    },
    {
      'name': 'Community',
      'icondata': Icons.school,
      'tabwidget': CommunityTab(),
    },
    {
      'name': 'Settings',
      'icondata': Icons.settings,
      'tabwidget': SettingsTab(),
    },
  ];

  List<BottomNavigationBarItem> getNavBarItems() {
    List<BottomNavigationBarItem> build = [];
    for (int i = 0; i < pages.length; i++) {
      build.add(BottomNavigationBarItem(
        icon: Icon(pages[i]['icondata']),
        label: pages[i]['name'],
        activeIcon: Icon(pages[i]['icondata'], color: Theme.of(context).iconTheme.color),
      ));
    }
    return build;
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex]['tabwidget'],
      appBar: AppBar(
        title: Text('MasterChef', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Text('test1'),
          ],
        ),
        elevation: 2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: getNavBarItems(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
