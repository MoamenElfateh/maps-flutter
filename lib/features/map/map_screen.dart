import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';
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
                cameraPosition: _myCurrentLocationCameraPosition,
                mapController: _mapController,
              )
              : Center(child: CircularProgressIndicator(color: MyColors.blue)),
          FloatingSearchBarWidget(),
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
}
