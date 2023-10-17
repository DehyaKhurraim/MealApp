import 'package:flutter/material.dart';
import '../data.dart';

class MealDetail extends StatelessWidget {
  final String mealId;
  const MealDetail({Key? key, required this.mealId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedMeal = MEAL.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(selectedMeal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 350,
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 350,
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).canvasColor,
                        child: Text(
                          '# ${index + 1}',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(color: Theme.of(context).dividerColor),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
