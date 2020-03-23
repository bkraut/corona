import 'package:corona/Model/UserLocation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text('Location Lat: ${userLocation.latitude}, Lon: ${userLocation.longitude}'),
    );
  }
}