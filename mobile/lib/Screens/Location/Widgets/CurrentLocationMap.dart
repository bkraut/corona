import 'package:corona/Model/UserLocation.dart';
import 'package:corona/globals.dart' as globals;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class CurrentLocationMap extends StatelessWidget {

  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(userLocation.latitude, userLocation.longitude),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(userLocation.latitude, userLocation.longitude),
              builder: (ctx) =>
              new Container(
                child: Icon(Icons.gps_fixed),
              ),
            ),
          ],
        ),
      ],
    );
  }

}