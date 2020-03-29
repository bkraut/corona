import 'dart:async';
import 'dart:convert';



import 'package:corona/Model/RestResponse.dart';
import 'package:corona/Model/UserLocation.dart';
import 'package:location/location.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<RestResponse> postLocation(String url, {Map body}) async {
  return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
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

  // Emitting location updates
  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

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

            String url = "http://192.168.0.106:6080/api/account/9B88F3FA-38B4-4526-9987-55A165135608/track";
            print(url);
            RestResponse p = await postLocation(url, body: data.toMap());
            print(p.success.toString() + " >>> " + p.message);
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;
  StreamController<UserLocation> get locationController => _locationController;

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
}