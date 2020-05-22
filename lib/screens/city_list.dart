import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de cidades"),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("city").getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.documents.map((city) {
                  return ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      city.data["name"],
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  );
                }).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              );
            }
          }),
    );
  }
}
