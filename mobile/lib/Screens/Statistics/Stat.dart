import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

import 'package:corona/Screens/Statistics/Daily/DailyInfections.dart';
import 'package:corona/Screens/Statistics/Countries/InfectedPerCountry.dart';

class Stat extends StatelessWidget {
  final String title;
  Stat({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(40, 40, 40, 0.6)),
            child: Column(
              children: <Widget>[
                Text('Po dnevih za Slovenijo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Expanded(
                  child: DailyInfections.withSampleData(),
                ),
              ],
            ),
          )),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(40, 40, 40, 0.6)),
                  child: Column(
                    children: <Widget>[
                      Text('Po državah',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Expanded(child: InfectedPerCountryChart()),
                    ],
                  ))),
        ],
      ),
    );
  }
}
