// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDirections {
  late LatLngBounds bounds;
  late List<PointLatLng> polyLinePoints;
  late String totalDistance;
  late String totalDuration;
  PlaceDirections({
    required this.bounds,
    required this.polyLinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory PlaceDirections.fromJson(Map<String, dynamic> json) {
    final data = Map<String, dynamic>.from(
      json["routes"][0],
    ); // first object in List
    final northeast = data["bounds"]["northeast"];
    final southwest = data["bound"]["southwest"];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast["lat"], northeast["lng"]),
      southwest: LatLng(southwest["lat"], southwest["lng"]),
    );

    late String distance;
    late String duration;

    if ((data["legs"] as List).isNotEmpty) {
      final leg = data["legs"][0];
      distance = leg["distance"]["text"];
      duration = leg["duration"]["text"];
    }
    return PlaceDirections(
      bounds: bounds,
      polyLinePoints: PolylinePoints().decodePolyline(
        data["overview_polyline"]["points"],
      ),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}
