import 'package:corona/globals.dart' as globals;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class CurrentLocationMap extends StatelessWidget {

  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(globals.currentLocation.latitude, globals.currentLocation.longitude),
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
              point: new LatLng(globals.currentLocation.latitude, globals.currentLocation.longitude),
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