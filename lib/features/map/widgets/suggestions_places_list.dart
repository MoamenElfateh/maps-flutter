import 'package:flutter/material.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/features/map/widgets/suggestions_places_list_item.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SuggestionsPlacesList extends StatelessWidget {
  const SuggestionsPlacesList({
    super.key,
    required this.places,
    required this.floatingSearchBarController,
  });
  final List<PlaceSuggestions> places;
  final FloatingSearchBarController floatingSearchBarController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () {
            floatingSearchBarController.close();
          },
          child: SuggestionsPlacesListItem(suggestions: places[index]),
        );
      },
    );
  }
}
