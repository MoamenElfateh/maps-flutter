import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_flutter/data/models/place_suggestions.dart';
import 'package:maps_flutter/data/repository/maps_repo.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepo mapsRepo;
  MapsCubit(this.mapsRepo) : super(MapsInitial());

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepo.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(places: suggestions));
    });
  }
}
