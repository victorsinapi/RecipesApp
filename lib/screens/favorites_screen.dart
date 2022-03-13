import 'package:flutter/material.dart';
import 'package:flutter_03_meal/models/meal.dart';
import 'package:flutter_03_meal/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavoritesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty)
      return Center(
        child: Text('No favorites yet!'),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
            favorites[index].id,
            favorites[index].title,
            favorites[index].imageUrl,
            favorites[index].duration,
            favorites[index].complexity,
            favorites[index].affordability),
        itemCount: favorites.length,
      );
  }
}
