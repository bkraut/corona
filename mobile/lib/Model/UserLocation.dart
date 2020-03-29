class UserLocation {
  final double latitude;
  final double longitude;
  UserLocation({this.latitude, this.longitude});

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      latitude: json['lan'],
      longitude: json['lon']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["lan"] = latitude;
    map["lon"] = longitude;
    return map;
  }

}