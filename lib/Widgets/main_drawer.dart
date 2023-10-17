import 'package:flutter/material.dart';
import 'package:meals_app/Screens/favorites.dart';
import 'package:meals_app/Screens/filter.dart';

class MainDrawer extends StatefulWidget {
  final VoidCallback onDrawerClosed;

  MainDrawer({required this.onDrawerClosed, super.key});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AnimatedHeader(
            animation: _animation,
          ),
          const SizedBox(
            height: 20,
          ),
          buildAnimatedDrawerItem(
            icon: Icons.restaurant_menu_outlined,
            title: 'Meals',
            context: context,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          buildAnimatedDrawerItem(
            icon: Icons.settings,
            title: 'Filters',
            context: context,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) {
                    return const Filter();
                  },
                  transitionsBuilder: (_, animation, __, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildAnimatedDrawerItem({
    required IconData icon,
    required String title,
    required BuildContext context,
    required VoidCallback onTap,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0),
        end: Offset.zero,
      ).animate(_animation),
      child: FadeTransition(
        opacity: _animation,
        child: ListTile(
          leading: Icon(
            icon,
            size: 26,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

class AnimatedHeader extends StatelessWidget {
  final Animation<double> animation;

  const AnimatedHeader({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).primaryColor,
        child: Text(
          'Delicious MEALs',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
