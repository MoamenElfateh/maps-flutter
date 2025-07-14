// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_flutter/business_logic/cubit/maps/maps_cubit.dart';
import 'package:maps_flutter/data/models/place_details.dart';

// ignore: must_be_immutable
class SelectedPlaceLocationDetailsBloc extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SelectedPlaceLocationDetailsBloc({
    super.key,
    required this.selectedPlace,
    required this.goToSearchedLocationDetails,
    required this.position,
  });
  late final PlaceDetails selectedPlace;
  final Future<void> Function() goToSearchedLocationDetails;
  Position? position;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationDetailsLoaded) {
          selectedPlace = (state).placeDetails;
          goToSearchedLocationDetails();
          getDirections(context);
        }
      },
      child: Container(),
    );
  }

  void getDirections(BuildContext context) {
    BlocProvider.of<MapsCubit>(context).emitPlaceDirection(
      LatLng(position!.latitude, position!.longitude),
      LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
    );
  }
}
