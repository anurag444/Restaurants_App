import 'dart:ui';

import 'package:Restaurants_App/screens/categories_screen.dart';
import 'package:Restaurants_App/screens/category_meals_screen.dart';
import 'package:Restaurants_App/screens/filters_screen.dart';
import 'package:Restaurants_App/screens/meal_detail_screen.dart';
import 'package:Restaurants_App/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(),
      routes: {
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
    );
  }
}
