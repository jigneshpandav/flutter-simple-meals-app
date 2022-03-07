import 'package:flutter/material.dart';
import 'package:flutter_simple_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters")),
      drawer: MainDrawer(),
      body: Container(
        child: Text("Filters"),
      ),
    );
  }
}
