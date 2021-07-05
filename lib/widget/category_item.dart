import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/screen/category_meal.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {
        Navigator.of(context).pushNamed('/category-meals', arguments: {
          'id': id,
          'title': title,
          'color': color,
        });
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        // margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
