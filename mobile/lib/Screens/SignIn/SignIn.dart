import 'dart:convert';

import 'package:corona/Model/RestResponse.dart';
import 'package:corona/Screens/Home/Home.dart';
import 'package:corona/Screens/SignIn/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import '../News/NewsListPage.dart';
import 'package:http/http.dart' as http;

Future<String> attemptLogIn(String username, String password) async {
  var res = await http.post(
      "$SERVER_IP/login",
      body: {
          "username": username,
          "password": password
      }
  );
  if(res.statusCode == 200) return res.body;
  return null;
}

Future<Route> attemptRegister(String number, String birthYear) async {
  var url = '$SERVER_IP/api/account/register';
  Map data = {
    'username': '$number',
    'birthYear': '$birthYear'
  };
  var body = json.encode(data);
  return await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body
  ).then((http.Response response) async {

    print("${response.statusCode}");
    print("${response.body}");

    final int statusCode = response.statusCode;
    var json = response.body;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    var token = await storage.write(key: "corona_jwt", value: null);
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  });
}

class SignIn extends StatelessWidget {

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _birthYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Assets/background.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 120,),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          controller: _numberController,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white
                              )
                            ),
                            labelText: 'Telefonska številka',
                            labelStyle: TextStyle(fontSize: 25, color: Colors.white)
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _birthYearController,
                        //obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white
                              )
                            ),
                            labelText: 'Letnica rojstva',
                            labelStyle: TextStyle(fontSize: 25,
                            color: Colors.white)
                          ),
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: MaterialButton(
                    onPressed: () async {
                      var number = _numberController.text;
                      var birthYear = _birthYearController.text;
                      var route = await attemptRegister(number, birthYear);
                      Navigator.of(context).push(route);
                    },
                    child: Text('Registriraj',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    color: Color(0xffd93036),
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Home(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}