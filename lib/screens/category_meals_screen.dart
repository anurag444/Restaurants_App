import 'package:Restaurants_App/models/meal.dart';
import 'package:Restaurants_App/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _initLoadedData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initLoadedData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _initLoadedData = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              displayMeals[index].id,
              displayMeals[index].title,
              displayMeals[index].imageUrl,
              displayMeals[index].duration,
              displayMeals[index].complexity,
              displayMeals[index].affordability,
            );
          },
          itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
