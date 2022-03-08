import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/dummy_data.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  final Function toggleFavorite;
  final Function isMealFavorite;

  const MealDetailScreen({
    Key? key,
    required this.toggleFavorite,
    required this.isMealFavorite,
  }) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    // color: Theme.of(context).,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients[index])));
              },
              itemCount: meal.ingredients.length,
            )),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    if (index != meal.steps.length - 1) Divider()
                  ],
                );
              },
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: SpeedDial(icon: Icons.call_to_action, children: [
        SpeedDialChild(
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          label: 'Delete',
          backgroundColor: Colors.redAccent,
          onTap: () {
            Navigator.of(context).pop(mealId);
          },
        ),
        SpeedDialChild(
          child: Icon(
            isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
            color: Colors.black87,
          ),
          label: 'Favorite',
          backgroundColor: Colors.amberAccent,
          onTap: () {
            toggleFavorite(mealId);
          },
        ),
      ]),
    );
  }
}
