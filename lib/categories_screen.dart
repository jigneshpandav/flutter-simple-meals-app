import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_simple_meals_app/category_item.dart';
import 'package:flutter_simple_meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DeliMeal")),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: DUMMY_CATEGORIES
            .map((category) => CategoryItem(
                  category: category,
                ))
            .toList(),
      ),
    );
  }
}
