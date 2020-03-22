import 'package:flutter/material.dart';

import 'package:corona/Screens/SignIn/SignIn.dart';
import 'package:corona/Screens/Home/Main.dart';
import 'package:corona/Screens/Location/InfectionMap.dart';
import 'package:corona/Screens/Statistics/Stat.dart';
import 'package:corona/Screens/Statistics/AlbumList.dart';
import 'package:corona/Screens/Location/Tracking.dart';
import 'package:corona/Screens/News/NewsListPage.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('Assets/image2.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Mapa'),
                  Tab(text: 'Okužbe'),
                  Tab(text: 'Statistika'),
                  Tab(text: 'Novice'),
                ],
              ),
              title: Text('Corona'),
              backgroundColor: Color.fromRGBO(80, 80, 80, 0.8),
            ),
            body: TabBarView(
              children: [
                Main(),
                Text("Test"),
                Stat(),
                NewsListPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
