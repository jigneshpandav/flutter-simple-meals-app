import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/widgets/category_item.dart';
import 'package:flutter_simple_meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
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
    );
  }
}
