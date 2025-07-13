import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';
import 'package:maps_flutter/data/models/place_details.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/features/map/widgets/floating_search_bar_widget.dart';
import 'package:maps_flutter/features/map/widgets/phone_map.dart';
import 'package:maps_flutter/features/map/widgets/drawer_side.dart';
import 'package:maps_flutter/helpers/location_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );
  // these variables for getPlaceLocationDetails
  Set<Marker> markers = {}; //
  late PlaceSuggestions placeSuggestions; //
  late PlaceDetails selectedPlace; //
  late Marker searchedPlaceMarker; //
  late Marker currentLocationMarker;
  late CameraPosition searchedPlaceCameraPosition; //

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? PhoneMap(
                markers: markers,
                cameraPosition: _myCurrentLocationCameraPosition,
                mapController: _mapController,
              )
              : Center(child: CircularProgressIndicator(color: MyColors.blue)),
          FloatingSearchBarWidget(
            placeSuggestion: placeSuggestions,
            selectedPlace: selectedPlace,
            goToSearchedLocationDetails: goToSearchedLocationDetails,
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: MyColors.blue,
          onPressed: _goToMyCurrentLocation,
          child: Icon(Icons.place, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.getCurrentLocation();

    // depend on opened internet
    // position = await LocationHelper.getCurrentLocation().whenComplete(() {
    //   setState(() {});
    // });

    // used if you closed internet (Cached)
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition),
    );
  }

  void buildCameraNewPosition() {
    searchedPlaceCameraPosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      zoom: 13,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
    );
  }

  Future<void> goToSearchedLocationDetails() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(searchedPlaceCameraPosition),
    );
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker() {
    searchedPlaceMarker = Marker(
      position: searchedPlaceCameraPosition.target,
      markerId: MarkerId("2"),
      onTap: () {
        buildCurrentLocationMarker();
      },
      infoWindow: InfoWindow(title: placeSuggestions.description),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    addMarkerToMarkersAndUpdateUI(searchedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: MarkerId("1"),
      onTap: () {},
      infoWindow: InfoWindow(title: "your current location"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    addMarkerToMarkersAndUpdateUI(currentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }
}
