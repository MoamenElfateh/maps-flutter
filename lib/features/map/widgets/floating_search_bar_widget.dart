// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import 'package:maps_flutter/business_logic/cubit/maps/maps_cubit.dart';
import 'package:maps_flutter/core/theming/my_colors.dart';
import 'package:maps_flutter/data/models/place_details.dart';
import 'package:maps_flutter/data/models/place_directions.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/features/map/widgets/distance_and_duration_bloc.dart';
import 'package:maps_flutter/features/map/widgets/selected_place_location_details_bloc.dart';
import 'package:maps_flutter/features/map/widgets/suggestions_bloc.dart';

// ignore: must_be_immutable
class FloatingSearchBarWidget extends StatefulWidget {
  // ignore: use_super_parameters, prefer_const_constructors_in_immutables
  FloatingSearchBarWidget({
    Key? key,
    required this.placeSuggestion,
    required this.selectedPlace,
    required this.goToSearchedLocationDetails,
    required this.progressIndicator,
    required this.isTimeAndDistanceVisible,
    required this.placeDirections,
    required this.polyLinesPoints,
    this.position,
    required this.removeAllMarkersAndUpdateUI,
  }) : super(key: key);
  late final PlaceSuggestions placeSuggestion;
  late final PlaceDetails selectedPlace;
  final Future<void> Function() goToSearchedLocationDetails;
  late final bool progressIndicator;
  late final bool isTimeAndDistanceVisible;
  late final PlaceDirections placeDirections;
  late final List<LatLng> polyLinesPoints;
  final void Function() removeAllMarkersAndUpdateUI;

  Position? position;

  @override
  State<FloatingSearchBarWidget> createState() =>
      _FloatingSearchBarWidgetState();
}

class _FloatingSearchBarWidgetState extends State<FloatingSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    final FloatingSearchBarController floatingSearchBarController =
        FloatingSearchBarController();
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      controller: floatingSearchBarController,
      elevation: 6,
      hintStyle: TextStyle(fontSize: 18.sp),
      queryStyle: TextStyle(fontSize: 18.sp),
      hint: 'Find a place',
      border: BorderSide(style: BorderStyle.none),
      margins: EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 52,
      iconColor: MyColors.blue,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600.w : 500.w,
      debounceDelay: const Duration(milliseconds: 500),
      progress: widget.progressIndicator,
      onQueryChanged: (query) {
        getPlacesSuggestions(query);
      },
      onFocusChanged: (isFocused) {
        // hide distance and time raw
        // click , not click
        setState(() {
          widget.isTimeAndDistanceVisible = false;
        });
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place, color: Colors.black87),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SuggestionsBloc(
                floatingSearchBarController: floatingSearchBarController,
                placeSuggestion: widget.placeSuggestion,
                polyLinesPoints: widget.polyLinesPoints,
                removeAllMarkersAndUpdateUI: widget.removeAllMarkersAndUpdateUI,
              ),
              SelectedPlaceLocationDetailsBloc(
                selectedPlace: widget.selectedPlace,
                goToSearchedLocationDetails: widget.goToSearchedLocationDetails,
                position: widget.position,
              ),
              DistanceAndDurationBloc(
                placeDirections: widget.placeDirections,
                polyLinesPoints: widget.polyLinesPoints,
              ),
            ],
          ),
        );
      },
    );
  }

  void getPlacesSuggestions(String query) {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(
      context,
    ).emitPlaceSuggestions(query, sessionToken);
  }
}
