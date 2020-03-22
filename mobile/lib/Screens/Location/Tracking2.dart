/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:corona/Widgets/boom.dart';

import 'src/get_location.dart';
import 'src/listen_location.dart';
import 'src/permission_status.dart';
import 'src/service_enabled.dart';

import 'package:corona/Widgets/boom.dart';

class Tracking2 extends StatelessWidget {
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

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Assets/image2.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        floatingActionButton: buildBoom(),
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
                  ListenLocationWidget(),
                  FlutterMap(
                    options: MapOptions(
                      center: LatLng(51.5, -0.09),
                      zoom: 5.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                        // For example purposes. It is recommended to use
                        // TileProvider with a caching and retry strategy, like
                        // NetworkTileProvider or CachedNetworkTileProvider
                        tileProvider: NonCachingNetworkTileProvider(),
                      ),
                      MarkerLayerOptions(markers: markers)
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/