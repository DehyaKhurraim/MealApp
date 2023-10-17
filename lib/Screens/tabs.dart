import 'package:flutter/material.dart';
import 'package:meals_app/Screens/catagories.dart';
import 'package:meals_app/Screens/favorites.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page': Catagories(), 'title': 'Categories'},
    {'page': Favourites(), 'title': 'Favourites'}
  ];
  int _selectedIndex = 0;
  bool _isDrawerOpen = false;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleDrawer() {
    if (_isDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      Scaffold.of(context).openDrawer();
    }
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (_isDrawerOpen && details.primaryDelta! > 0) {
          _toggleDrawer();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              _pages[_selectedIndex]['title'],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        drawer: MainDrawer(
          onDrawerClosed: () {
            setState(() {
              _isDrawerOpen = false;
            });
          },
        ),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutBack,
                transform: Matrix4.rotationZ(_selectedIndex == 0 ? 0 : 0.2),
                child: const Icon(
                  Icons.category_outlined,
                ),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutBack,
                transform: Matrix4.rotationZ(_selectedIndex == 1 ? 0 : 0.2),
                child: const Icon(
                  Icons.star_border_outlined,
                ),
              ),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
