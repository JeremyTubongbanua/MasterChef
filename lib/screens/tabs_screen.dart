import 'package:flutter/material.dart';
import 'package:masterchef/screens/tabs/community_tab.dart';
import 'package:masterchef/screens/tabs/recipes_tab.dart';
import 'package:masterchef/screens/tabs/your_fridge_tab.dart';

class TabsScreen extends StatefulWidget {
  static const String routeName = '/tabs';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late int _currentIndex;

  final List<Map<String, dynamic>> pages = [
    {
      'name': 'Your Fridge',
      'icondata': Icons.food_bank,
      'tabwidget': YourFridgeTab(),
    },
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
  ];

  List<BottomNavigationBarItem> getNavBarItems() {
    List<BottomNavigationBarItem> build = [];
    for (int i = 0; i < pages.length; i++) {
      build.add(BottomNavigationBarItem(
        icon: Icon(pages[i]['icondata'], color: Colors.black),
        label: pages[i]['name'],
        activeIcon: Icon(pages[i]['icondata'], color: Theme.of(context).iconTheme.color),
      ));
    }
    return build;
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 2;
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
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 10),
          decoration: BoxDecoration(color: Color.fromRGBO(255, 36, 0, .5)),
          child: ListView(
            children: [
              Text(
                'MasterChef',
                style: TextStyle(fontSize: 36),
              ),
              Text(
                'Developed by Jeremy Tubongbanua',
                style: TextStyle(fontSize: 12),
              ),
              Divider(),
              InkWell(
                child: ListTile(
                  onTap: () async {
                    await Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
                  },
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(color: Colors.black),
        fixedColor: Colors.black,
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
