import 'package:corona/Screens/SignIn/Login.dart';
import 'package:flutter/material.dart';
import 'Screens/SignIn/SignIn.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


const SERVER_IP = 'http://192.168.0.106:6080';
final storage = FlutterSecureStorage();

void main() => runApp(CoronaApp());

class CoronaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}