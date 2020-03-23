import 'dart:async';

import 'package:corona/Model/UserLocation.dart';
import 'package:location/location.dart';

class LocationService {

  UserLocation _currentLocation;
  var location = Location();

  // Emitting location updates
  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if(granted == PermissionStatus.GRANTED) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude
            ));
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