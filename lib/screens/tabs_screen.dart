import 'package:flutter/material.dart';

import './categories_screens.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'screen': CategoryScreen(),
      'title': 'Categories',
    },
    {
      'screen': FavouriteScreen(),
      'title': 'Favourites',
    },
  ];
  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text(
              'Favourites',
            ),
          ),
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Meals'),
  //         bottom: TabBar(
  //           tabs: <Widget>[
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Categories',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.star),
  //               text: 'Favourites',
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: TabBarView(
  //         children: <Widget>[
  //           CategoryScreen(),
  //           FavouriteScreen(),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
