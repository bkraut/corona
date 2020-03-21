import 'package:flutter/material.dart';

import 'src/flutter_boom_menu.dart';

BoomMenu buildBoom() {
  return BoomMenu(
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    backgroundColor: Colors.red,
    //child: Icon(Icons.add),
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    scrollVisible: true,
    overlayColor: Colors.black,
    overlayOpacity: 0.7,
    children: [
      MenuItem(
        child: Icon(Icons.accessibility, color: Colors.black),
        title: "Profiles",
        titleColor: Colors.white,
        subtitle: "You Can View the Noel Profile",
        subTitleColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        onTap: () => print('FIRST CHILD'),
      ),
      MenuItem(
        child: Icon(Icons.brush, color: Colors.black),
        title: "Profiles",
        titleColor: Colors.white,
        subtitle: "You Can View the Noel Profile",
        subTitleColor: Colors.white,
        backgroundColor: Colors.green,
        onTap: () => print('SECOND CHILD'),
      ),
      MenuItem(
        child: Icon(Icons.keyboard_voice, color: Colors.black),
        title: "Profile",
        titleColor: Colors.white,
        subtitle: "You Can View the Noel Profile",
        subTitleColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: () => print('THIRD CHILD'),
      ),
      MenuItem(
        child: Icon(Icons.ac_unit, color: Colors.black),
        title: "Profiles",
        titleColor: Colors.white,
        subtitle: "You Can View the Noel Profile",
        subTitleColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: () => print('FOURTH CHILD'),
      )
    ],
  );
}