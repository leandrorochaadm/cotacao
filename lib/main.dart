import 'package:cotacao/screens/city_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[800],
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        disabledColor: Colors.grey[600],
      ),
      home: CityList(),
    );
  }
}
