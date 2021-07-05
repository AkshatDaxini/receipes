
import 'package:flutter/material.dart';
import 'package:meal/screen/categories.dart';
import 'package:meal/screen/category_meal.dart';
import 'package:meal/screen/meal_details.dart';
import './screen/error.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(20, 51, 51, 1)),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Categories(),
      initialRoute: '/',
      routes: {
        '/category-meals' : (ctx) => CategoryMeals(),
        '/meal-detail' : (ctx) => MealDetails(),
      },
      onUnknownRoute: (Settings){
        return MaterialPageRoute(builder: (ctx) => Error(),);
      },
    );
  }
}
