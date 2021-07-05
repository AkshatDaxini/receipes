import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/models/meal.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({Key? key}) : super(key: key);

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  int counter = 0;
  int steps_len = 0;
  bool visible_backward = false;
  bool visible_forward = true;
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget ingredients(Meal selectedMeal) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Ingredients",style: Theme.of(context).textTheme.title,),
          Divider(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 280,
            width: 280,
            child:   ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
        ],
      ),
    );
  }
  Widget steps(Meal selectedMeal){
    return Column(
      children: [
        Text("Steps",style: Theme.of(context).textTheme.title,),
        Divider(),
        Text((counter + 1).toString() +
            " out of " +
            selectedMeal.steps.length.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Visibility(
                visible: counter == 0 ? false : true,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 265,
                width: 280,
                child: Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.steps[counter],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
            ),
            Expanded(
              child: Visibility(
                visible: counter == steps_len - 1 ? false : true,
                child: IconButton(
                  enableFeedback: true,
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    String id = routeArgs["id"];
    String title = routeArgs["title"];
    Color color = routeArgs["color"];
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    steps_len = selectedMeal.steps.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: color.withOpacity(.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              image(selectedMeal),
              MediaQuery.of(context).size.width > 700 ?Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
               children: [
                 Expanded(child: ingredients(selectedMeal)),
                 Expanded(child: steps(selectedMeal)),
               ],
              ) :Column(
                children: [
                  ingredients(selectedMeal),
                  steps(selectedMeal),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget image(Meal selectedMeal) {
    return Container(
            height: 250,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          );
  }
}
