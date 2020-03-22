/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

import 'get_location.dart';
import 'listen_location.dart';
import 'permission_status.dart';
import 'service_enabled.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Flutter Location Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Location location = new Location();

  _showInfoDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Demo Application'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Created by Guillaume Bernos'),
                InkWell(
                  child: Text(
                    'https://github.com/Lyokone/flutterlocation',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () =>
                      launch("https://github.com/Lyokone/flutterlocation"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: _showInfoDialog,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            PermissionStatusWidget(),
            Divider(
              height: 32,
            ),
            ServiceEnabledWidget(),
            Divider(
              height: 32,
            ),
            GetLocationWidget(),
            Divider(
              height: 32,
            ),
            ListenLocationWidget()
          ],
        ),
      ),
    );
  }
}
import 'package:corona/Widgets/boom.dart';

class Tracking extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(51.5, -0.09),
        builder: (ctx) => Container(
          child: FlutterLogo(
            colors: Colors.blue,
            key: ObjectKey(Colors.blue),
          ),
        ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(53.3498, -6.2603),
        builder: (ctx) => Container(
          child: FlutterLogo(
            colors: Colors.green,
            key: ObjectKey(Colors.green),
          ),
        ),
      ),
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(48.8566, 2.3522),
        builder: (ctx) => Container(
          child: FlutterLogo(
            colors: Colors.purple,
            key: ObjectKey(Colors.purple),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Corona Alert'), backgroundColor: Colors.red,),
      //drawer: buildDrawer(context, route),
      floatingActionButton: buildBoom(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('This is a map that is showing (51.5, -0.9).'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.5, -0.09),
                  zoom: 5.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    // For example purposes. It is recommended to use
                    // TileProvider with a caching and retry strategy, like
                    // NetworkTileProvider or CachedNetworkTileProvider
                    tileProvider: NonCachingNetworkTileProvider(),
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/