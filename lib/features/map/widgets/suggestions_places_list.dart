// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import 'package:maps_flutter/business_logic/cubit/maps/maps_cubit.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/features/map/widgets/suggestions_places_list_item.dart';

class SuggestionsPlacesList extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SuggestionsPlacesList({
    super.key,
    required this.places,
    required this.floatingSearchBarController,
    required this.placeSuggestion,
  });
  final List<PlaceSuggestions> places;
  final FloatingSearchBarController floatingSearchBarController;
  late final PlaceSuggestions placeSuggestion;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () async {
            placeSuggestion = places[index];
            floatingSearchBarController.close();
            getSelectedPlaceLocationDetails(context);
          },
          child: SuggestionsPlacesListItem(suggestion: places[index]),
        );
      },
    );
  }

  void getSelectedPlaceLocationDetails(BuildContext context) {
    final sessionToken = Uuid().v4();
    BlocProvider.of<MapsCubit>(
      context,
    ).emitPlaceLocationDetails(placeSuggestion.placeId, sessionToken);
  }
}
