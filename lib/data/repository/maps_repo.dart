import 'package:maps_flutter/data/models/place_details.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/data/webservices/places_web_services.dart';

class MapsRepo {
  final PlacesWebServices placesWebServices;

  MapsRepo({required this.placesWebServices});

  Future<List<PlaceSuggestions>> fetchSuggestions(
    String place,
    String sessionToken,
  ) async {
    final suggestions = await placesWebServices.fetchSuggestions(
      place,
      sessionToken,
    );

    return suggestions
        .map((suggestion) => PlaceSuggestions.fromJson(suggestion))
        .toList();
  }

  Future<PlaceDetails> getPlaceLocationDetails(
    String placeId,
    String sessionToken,
  ) async {
    final placeDetails = await placesWebServices.getPlaceLocationDetails(
      placeId,
      sessionToken,
    );
    var readyPlace = PlaceDetails.fromJson(placeDetails);
    return readyPlace;
  }
}
