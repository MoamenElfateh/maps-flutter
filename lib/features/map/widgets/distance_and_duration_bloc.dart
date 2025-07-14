// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:maps_flutter/business_logic/cubit/maps/maps_cubit.dart';
import 'package:maps_flutter/data/models/place_directions.dart';

class DistanceAndDurationBloc extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  DistanceAndDurationBloc({
    super.key,
    required this.placeDirections,
    required this.polyLinesPoints,
  });
  late final PlaceDirections placeDirections;
  late final List<LatLng> polyLinesPoints;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is DirectionsLoaded) {
          placeDirections = (state).placeDirections;
          getPolyLinePoints();
        }
      },
    );
  }

  void getPolyLinePoints() {
    polyLinesPoints =
        placeDirections.polyLinePoints
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList();
  }
}
