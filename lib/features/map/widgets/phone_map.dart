// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_flutter/data/models/place_directions.dart';

class PhoneMap extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PhoneMap({
    super.key,
    required this.cameraPosition,
    required this.mapController,
    required this.markers,
    required this.placeDirections,
    required this.polyLinesPoints,
  });

  final CameraPosition cameraPosition;
  final Completer<GoogleMapController> mapController;
  final Set<Marker> markers;
  late final PlaceDirections placeDirections;
  late final List<LatLng> polyLinesPoints;

  @override
  State<PhoneMap> createState() => _PhoneMapState();
}

class _PhoneMapState extends State<PhoneMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: widget.markers,
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: widget.cameraPosition,
      onMapCreated: (GoogleMapController controller) {
        widget.mapController.complete(controller);
      },
      polylines:
          widget.polyLinesPoints.isNotEmpty
              ? {
                Polyline(
                  polylineId: const PolylineId("my_polyLine"),
                  color: Colors.black,
                  width: 2,
                  points: widget.polyLinesPoints,
                ),
              }
              : {},
    );
  }
}
