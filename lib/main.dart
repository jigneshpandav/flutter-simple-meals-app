import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/screens/meal_detail_screen.dart';
import 'package:flutter_simple_meals_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

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
            accentColor: Colors.indigo,
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
        initialRoute: TabsScreen.routeName,
        routes: {
          TabsScreen.routeName: (ctx) => const TabsScreen(),
          CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
          CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        });
  }
}
