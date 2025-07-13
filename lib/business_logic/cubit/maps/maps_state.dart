part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

final class MapsInitial extends MapsState {}

class PlacesLoaded extends MapsState {
  final List<PlaceSuggestions> places;
  PlacesLoaded({required this.places});
}

class PlaceLocationDetailsLoaded extends MapsState {
  final PlaceDetails placeDetails;

  PlaceLocationDetailsLoaded(this.placeDetails);
}
