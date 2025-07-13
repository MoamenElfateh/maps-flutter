// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:maps_flutter/business_logic/cubit/maps/maps_cubit.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/features/map/widgets/suggestions_places_list.dart';

class SuggestionsBloc extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SuggestionsBloc({
    super.key,
    required this.floatingSearchBarController,
    required this.placeSuggestion,
  });
  final FloatingSearchBarController floatingSearchBarController;
  late final PlaceSuggestions placeSuggestion;

  @override
  Widget build(BuildContext context) {
    List<PlaceSuggestions> places = [];
    return BlocBuilder<MapsCubit, MapsState>(
      builder: (context, state) {
        if (state is PlacesLoaded) {
          places = (state).places;

          if (places.isNotEmpty) {
            return SuggestionsPlacesList(
              placeSuggestion: placeSuggestion,
              places: places,
              floatingSearchBarController: floatingSearchBarController,
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
