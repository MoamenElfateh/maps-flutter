// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlaceDetails {
  late Result result;
  PlaceDetails({required this.result});

  PlaceDetails.fromJson(dynamic json) {
    result = Result.fromJson(json["result"]);
  }
}

class Result {
  late Geometry geometry;
  Result({required this.geometry});

  Result.fromJson(dynamic json) {
    geometry = Geometry.fromJson(json["geometry"]);
  }
}

class Geometry {
  late Location location;
  Geometry({required this.location});

  Geometry.fromJson(dynamic json) {
    location = Location.fromJson(json["location"]);
  }
}

class Location {
  late double lat;
  late double lng;
  Location({required this.lat, required this.lng});

  Location.fromJson(dynamic json) {
    lat = json["lat"];
    lng = json["lng"];
  }
}
