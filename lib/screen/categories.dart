import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/widget/category_item.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Meal"),),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((item){
          return CategoryItem(item.id,item.title,item.color);
        }).toList(),
      ),
    );
  }
}
