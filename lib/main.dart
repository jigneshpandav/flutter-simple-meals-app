import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/dummy_data.dart';
import 'package:flutter_simple_meals_app/models/meal.dart';
import 'package:flutter_simple_meals_app/screens/filters_screen.dart';
import 'package:flutter_simple_meals_app/screens/meal_detail_screen.dart';
import 'package:flutter_simple_meals_app/screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _saveFilters(Map<String, bool> filterData, BuildContext context) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] as bool) && !meal.isGlutenFree) {
          print("inside if");
          return false;
        }
        if ((_filters['lactose'] as bool) && !meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] as bool) && !meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] as bool) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
      return;
    }

    setState(() {
      _favoriteMeals
          .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
    });
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.blueAccent,
          ).copyWith(
            secondary: Colors.blueAccent,
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
          TabsScreen.routeName: (ctx) =>
              TabsScreen(favoriteMeals: _favoriteMeals),
          CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
                availableMeals: _availableMeals,
              ),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(
                toggleFavorite: _toggleFavorite,
                isMealFavorite: _isMealFavorite,
              ),
          FiltersScreen.routeName: (ctx) => FiltersScreen(
                currentFilters: _filters,
                saveFilters: _saveFilters,
              ),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        });
  }
}
