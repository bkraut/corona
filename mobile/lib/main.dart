import 'package:flutter/material.dart';
import 'package:corona/Screens/Home/Home.dart';


void main() => runApp(CoronaApp());

class CoronaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}