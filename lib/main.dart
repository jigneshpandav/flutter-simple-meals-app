import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          secondary: Colors.teal,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 240, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // titleLarge: TextStyle(
              //     color: Color.fromRGBO(20, 51, 51, 0.1),
              //     fontSize: 25.5,
              //     fontFamily: 'RobotoCondensed'),
              // titleSmall: TextStyle(
              //     color: Color.fromRGBO(20, 51, 51, 0.1),
              //     fontSize: 25.5,
              //     fontFamily: 'RobotoCondensed'),
              subtitle1: const TextStyle(
                fontSize: 26,
                fontFamily: 'RobotoCondensed',
              ),
              subtitle2: const TextStyle(
                fontSize: 18,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: CategoriesScreen(),
      routes: {
        '/category-meals': (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
