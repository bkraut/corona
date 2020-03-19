import 'package:flutter/material.dart';

import 'SignIn/SignIn.dart';
import 'Screens/Main.dart';
import 'Location/InfectionMap.dart';
import 'Statistics/Stat.dart';
import 'Location/Tracking.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(),
      //body: Main(),
      //body: InfectionMap(),
      //body: StackedAreaCustomColorLineChart.withSampleData(),
      //body: Tracking(),
    );
  }
}
