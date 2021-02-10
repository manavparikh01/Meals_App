import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  //final String categoryId;
  //final String categoryTitle;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle);
  //String categoryTitle;
  //List<Meal> displayedMeal;
  //var _loadedData = false;

  //@override
  //void initState() {
  // TODO: implement initState

  //super.initState();
  //}

  //@override
  //void didChangeDependencies() {
  // TODO: implement didChangeDependencies

  //     _loadedData = true;
  //   }
  //   super.didChangeDependencies();
  // }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeal.where((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //if (!_loadedData) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final displayedMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
            imageUrl: displayedMeal[index].imageUrl,
            //removeItem: _removeMeal,
            //passedId: null,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
