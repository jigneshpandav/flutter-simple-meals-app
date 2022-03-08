import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  FavoritesScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _removeItem(String itemId) {
    setState(() {
      widget.favoriteMeals.removeWhere((meal) => meal.id == itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.length <= 0
        ? Center(
            child: Text(
              "You have no favorites yet - start adding some!",
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              final Meal meal = widget.favoriteMeals[index];
              return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability,
                removeItem: _removeItem,
              );
            },
            itemCount: widget.favoriteMeals.length,
          );
  }
}
