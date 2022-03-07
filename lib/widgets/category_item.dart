import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/screens/category_meals_screen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void selectCategory(BuildContext btx, Category category) {
    Navigator.of(btx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        // splashColor: Theme.of(context).primaryColor,
        splashColor: category.color,
        borderRadius: BorderRadius.circular(15),
        onTap: () => selectCategory(context, category),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(1, 1, 1, 0.2), blurRadius: 10.0)
            ],
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.65),
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
