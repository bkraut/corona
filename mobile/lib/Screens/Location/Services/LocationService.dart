import 'dart:async';
import 'dart:convert';



import 'package:corona/Model/RestResponse.dart';
import 'package:corona/Model/UserLocation.dart';
import 'package:location/location.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

Future<RestResponse> postLocation(String url, {Map body}) async {
  var storage = FlutterSecureStorage();
  var token = await storage.read(key: "pandemic_token");
  return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Bearer': token
      },
      body: jsonEncode(body)
  ).then((http.Response response) {
    final int statusCode = response.statusCode;
    var json = response.body;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return RestResponse.fromJson(jsonDecode(response.body));
  });
}




class LocationService {

  UserLocation _currentLocation;
  var location = Location();

  Future<UserLocation> getLocation() async {
    try {
      var _userLocation = await location.getLocation();
      _currentLocation = UserLocation(
          latitude: _userLocation.latitude,
          longitude: _userLocation.longitude
      );
    } catch(e) {
      print('Nisem uspel pridobiti lokacije: $e');
    }
    return _currentLocation;
  }

  // Emitting location updates
  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();
  Stream<UserLocation> get locationStream => _locationController.stream;
  StreamController<UserLocation> get locationController => _locationController;

  LocationService() {
    location.requestPermission().then((granted) {
      if(granted == PermissionStatus.GRANTED) {
        location.onLocationChanged().listen((locationData) async {
          if (locationData != null) {
              _locationController.add(UserLocation(
                  latitude: locationData.latitude,
                  longitude: locationData.longitude
              ));
              var data = new UserLocation(
                  latitude: locationData.latitude,
                  longitude: locationData.longitude
              );
              String url = SERVER_IP + "/api/account/location";
              print(url);
              RestResponse p = await postLocation(url, body: data.toMap());
              print(p.success.toString() + " >>> " + p.message);
            }
        });
      }
    });
  }




}