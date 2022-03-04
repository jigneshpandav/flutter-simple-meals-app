import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/category_meals_screen.dart';
import 'models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void selectCategory(BuildContext btx, Category category) {
    Navigator.of(btx).pushNamed('/category-meals', arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        onTap: () => selectCategory(context, category),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.7),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }
}
