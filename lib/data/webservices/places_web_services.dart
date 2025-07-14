import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_flutter/core/constants/strings.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
    String place,
    String sessionToken,
  ) async {
    try {
      Response response = await dio.get(
        suggestionsBaseURL,
        queryParameters: {
          "input": place,
          "types": "address",
          "components": "country:eg",
          "key": googleAPIKey,
          "sessionToken": sessionToken,
        },
      );
      return response.data["predictions"];
    } catch (error) {
      // print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocationDetails(
    String placeId,
    String sessionToken,
  ) async {
    try {
      Response response = await dio.get(
        placeLocationBaseURL,
        queryParameters: {
          "place_id": placeId,
          "fields": "geometry",
          "key": googleAPIKey,
          "sessionToken": sessionToken,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error(
        "Place location Error : ",
        StackTrace.fromString(("this is its trace")),
      );
    }
  }

  // origin equals current location , destination equals searched for location
  Future<dynamic> getDirections(LatLng origin, LatLng destination) async {
    try {
      Response response = await dio.get(
        directionsBaseURL,
        queryParameters: {
          "origin": "${origin.latitude},${origin.longitude}",
          "destination": "${destination.latitude},${destination.longitude}",
          "key": googleAPIKey,
        },
      );
      return response.data;
    } catch (error) {
      return Future.error(
        "Place location Error : ",
        StackTrace.fromString(("this is its trace")),
      );
    }
  }
}
