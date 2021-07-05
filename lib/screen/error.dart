import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline,color: Colors.grey,size: 40,),
              Text(
                "Error 404",
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ],
          ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Oops! Page Not Found",
              style: TextStyle(fontSize: 26, color: Colors.grey),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Text("Back to Home Page"))
          ],
        ),
      ),
    );
  }
}
