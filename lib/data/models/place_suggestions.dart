// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlaceSuggestions {
  late String placeId;
  late String description;
  PlaceSuggestions({required this.placeId, required this.description});

  PlaceSuggestions.fromJson(Map<String, dynamic> json) {
    placeId = json["place_id"];
    description = json["description"];
  }
}
