import 'package:flutter/material.dart';

import 'package:corona/Screens/SignIn/SignIn.dart';
import 'package:corona/Screens/Main.dart';
import 'package:corona/Screens/Location/InfectionMap.dart';
import 'package:corona/Screens/Statistics/Stat.dart';
import 'package:corona/Screens/Statistics/AlbumList.dart';
import 'package:corona/Screens/Location/Tracking.dart';
import 'package:corona/Screens/News/NewsListPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: SignIn(),
      //body: Main(),
      //body: InfectionMap(),
      //body: StackedAreaCustomColorLineChart.withSampleData(),
      //body: Tracking(),
      //body: Stat(Stat.createSampleData()),
      //body: Stat(title: "Statistika"),
      //body: AlbumList(),
      body: NewsListPage(title: "Novice")
    );
  }
}
