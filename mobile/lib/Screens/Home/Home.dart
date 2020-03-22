import 'package:flutter/material.dart';

import 'package:corona/Screens/SignIn/SignIn.dart';
import 'package:corona/Screens/Home/Main.dart';
import 'package:corona/Screens/Location/InfectionMap.dart';
import 'package:corona/Screens/Statistics/Stat.dart';
import 'package:corona/Screens/Statistics/AlbumList.dart';
import 'package:corona/Screens/Location/Tracking.dart';
import 'package:corona/Screens/News/NewsListPage.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'About', icon: Icons.account_box),
];

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
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {},
                ),
                // action button
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {},
                ),
                // overflow menu
                PopupMenuButton<Choice>(
                  //onSelected: _select,
                  color: Color.fromRGBO(30, 30, 30, 0.75),
                  elevation: 20,
                  itemBuilder: (BuildContext context) {
                    return choices.map((Choice choice) {
                      return PopupMenuItem<Choice>(
                        value: choice,
                          child: Row(
                            children: [
                            Icon(choice.icon),
                                SizedBox(width: 10.0),
                                Text(choice.title, style: TextStyle(color: Colors.white)),
                                SizedBox(width: 10.0),
                          ]),
                      );
                    }).toList();
                  },
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Mapa'),
                  Tab(text: 'Okužbe'),
                  Tab(text: 'Statistika'),
                  Tab(text: 'Novice'),
                ],
              ),
              title: Text('Corona Alert'),
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
