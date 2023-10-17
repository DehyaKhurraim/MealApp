import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/catagory_item.dart';
import 'package:meals_app/data.dart';

import '../Widgets/main_drawer.dart';

class Catagories extends StatefulWidget {
  @override
  _CatagoriesState createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedCategoryGrid(),
    );
  }
}

class AnimatedCategoryGrid extends StatefulWidget {
  @override
  _AnimatedCategoryGridState createState() => _AnimatedCategoryGridState();
}

class _AnimatedCategoryGridState extends State<AnimatedCategoryGrid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
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
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1.0, 0),
        end: Offset.zero,
      ).animate(_animation),
      child: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: CATEGORIES.map((catData) {
          return FadeTransition(
            opacity: _animation,
            child: ScaleTransition(
              scale: _animation,
              child: CategoryItem(
                title: catData.title,
                color: catData.color,
                Id: catData.id,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
