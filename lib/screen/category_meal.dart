import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/widget/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  // final String title;
  // final Color color;
  // final String id;
  //
  // CategoryMeals(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String title = routeArgs['title'];
    Color color = routeArgs['color'];
    String categoryId = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      body: MediaQuery.of(context).size.width >= 700
          ? Container(
              color: color.withOpacity(.3),
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisExtent: 350,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return MealItem(
                    id: categoryMeal[index].id,
                    categories: categoryMeal[index].categories,
                    title: categoryMeal[index].title,
                    imageUrl: categoryMeal[index].imageUrl,
                    duration: categoryMeal[index].duration,
                    complexity: categoryMeal[index].complexity,
                    affordability: categoryMeal[index].affordability,
                    color: color,
                  );
                },
                itemCount: categoryMeal.length,
              ),
            )
          : Container(
              color: color.withOpacity(.3),
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return MealItem(
                      id: categoryMeal[index].id,
                      categories: categoryMeal[index].categories,
                      title: categoryMeal[index].title,
                      imageUrl: categoryMeal[index].imageUrl,
                      duration: categoryMeal[index].duration,
                      complexity: categoryMeal[index].complexity,
                      affordability: categoryMeal[index].affordability,
                      color: color,
                    );
                  },
                  itemCount: categoryMeal.length),
            ),
    );
  }
}
