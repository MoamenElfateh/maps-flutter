// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maps_flutter/business_logic/cubit/maps/maps_cubit.dart';
import 'package:maps_flutter/data/models/place_details.dart';

class SelectedPlaceLocationDetailsBloc extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SelectedPlaceLocationDetailsBloc({
    super.key,
    required this.selectedPlace,
    required this.goToSearchedLocationDetails,
  });
  late final PlaceDetails selectedPlace;
  final Future<void> Function() goToSearchedLocationDetails;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapsCubit, MapsState>(
      listener: (context, state) {
        if (state is PlaceLocationDetailsLoaded) {
          selectedPlace = (state).placeDetails;
          goToSearchedLocationDetails();
        }
      },
      child: Container(),
    );
  }
}
