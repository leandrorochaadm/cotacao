import 'package:cotacao/models/city_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () async {
              City(
                      id: 11000,
                      name: "Porto Velho",
                      freteKg: 0.0,
                      freteNf: 0.0,
                      redespacho: 0.0,
                      freteMin: 0.0,
                      ajuste: 0.0,
                      obs: "obs")
                  .setFirebase();
//              city.setFirebase();
//              print("cityInsert: ${cityInsert.documentID}");
              //
            }),
      ),
    );
  }
}
