import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PhoneMap extends StatefulWidget {
  const PhoneMap({
    super.key,
    required this.cameraPosition,
    required this.mapController,
  });

  final CameraPosition cameraPosition;
  final Completer<GoogleMapController> mapController;

  @override
  State<PhoneMap> createState() => _PhoneMapState();
}

class _PhoneMapState extends State<PhoneMap> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: widget.cameraPosition,
      onMapCreated: (GoogleMapController controller) {
        widget.mapController.complete(controller);
      },
    );
  }
}
