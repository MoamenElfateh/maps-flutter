import 'package:dio/dio.dart';
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
      print(error.toString());
      return [];
    }
  }
}
