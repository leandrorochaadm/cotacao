import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class City {
  int id;
  String name;
  double freteKg;
  double freteNf;
  double redespacho;
  double ajuste;
  double freteMin;
  String obs;

  City(
      {@required this.id,
      @required this.name,
      @required this.freteKg,
      @required this.freteNf,
      @required this.redespacho,
      this.ajuste,
      @required this.freteMin,
      this.obs});

  City.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    freteKg = map['freteKg'];
    freteNf = map['freteNf'];
    redespacho = map['redespacho'];
    ajuste = map['ajuste'];
    freteMin = map['frete_min'];
    obs = map['obs'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['freteKg'] = this.freteKg;
    data['freteNf'] = this.freteNf;
    data['redespacho'] = this.redespacho;
    data['ajuste'] = this.ajuste;
    data['frete_min'] = this.freteMin;
    data['obs'] = this.obs;
    return data;
  }

  void setFirebase() async {
    await Firestore.instance
        .collection("city")
        .document(this.id.toString())
        .setData(toMap());
  }

  void deleteFirebase() async {
    await Firestore.instance
        .collection("city")
        .document(this.id.toString())
        .delete();
  }
}
