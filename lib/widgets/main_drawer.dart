import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/screens/filters_screen.dart';
import 'package:flutter_simple_meals_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
    String title,
    IconData iconData,
    VoidCallback tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 200,
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 20, right: 30, left: 20, bottom: 30),
          alignment: Alignment.bottomRight,
          color: Theme.of(context).colorScheme.primary,
          child: const Text(
            'Cooking up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        buildListTile("Meals", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        }),
        buildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ]),
    );
  }
}
