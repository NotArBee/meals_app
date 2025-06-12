import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen(
      {super.key, required this.meal, required this.onToggleFavoriteMeal});

  final Meal meal;
  final void Function(Meal meal) onToggleFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(overflow: TextOverflow.ellipsis, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavoriteMeal(meal);
              },
              icon: Icon(Icons.star_border))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(meal.imageUrl),
            SizedBox(
              height: 12,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            for (final mealIngredients in meal.ingredients)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mealIngredients,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            for (final mealSteps in meal.steps)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mealSteps,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
