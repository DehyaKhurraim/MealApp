import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/data.dart';

class Meals extends StatelessWidget {
  final catId;
  final catTitle;
  final List catMeal;

  Meals({Key? key, required this.catId, required this.catTitle})
      : catMeal =
            MEAL.where((meal) => meal.categories.contains(catId)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          catTitle,
          style: Theme.of(context).textTheme.headline1?.copyWith(
            fontSize: 24,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(1, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: catMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            Id: catMeal[index].id,
            title: catMeal[index].title,
            imageUrl: catMeal[index].imageUrl,
            duration: catMeal[index].duration,
            complexity: catMeal[index].complexity,
            affordability: catMeal[index].affordability,
          );
        },
      ),
    );
  }
}
