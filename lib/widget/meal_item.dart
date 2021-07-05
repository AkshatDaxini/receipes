import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meal/models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color color;

  const MealItem({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(15) ,
      onTap: () {
        Navigator.of(context).pushNamed('/meal-detail', arguments: {
          'title' : title,
          'id' : id,
          'color' : color,
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Container(
                                height: 250,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                )));
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: width < 700 ? 350 : 300,
                    color: Colors.black.withOpacity(.5),
                    child: Text(
                      title,
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule_sharp),
                      SizedBox(
                        width: 3,
                      ),
                      Text(duration.toString() + " min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 3,
                      ),
                      Text(affordability.toString().substring(14).toUpperCase()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 3,
                      ),
                      Text(complexity.toString().substring(11).toUpperCase()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
