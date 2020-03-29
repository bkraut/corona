class RestResponse {
  final bool success;
  final String message;

  RestResponse({this.success, this.message});

  factory RestResponse.fromJson(Map<String, dynamic> json) {
    return RestResponse(
        success: json['success'],
        message: json['message']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["success"] = success;
    map["message"] = message;
    return map;
  }

}