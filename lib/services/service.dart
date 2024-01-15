import 'dart:convert';
import 'package:flutter_application_1/constants/secrets.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:http/http.dart' as http;


class WeatherApiClient {
  Future<Weather?> getCurrentWeather(String? location) async {
    try {
      var endpoint = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apikey&units=metric");

      var response = await http.get(endpoint);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return Weather.fromJson(body);
      } else {
        // Handle non-200 status code
        ("Error: ${response.statusCode}");
        return null; // Or throw an exception if you want to propagate the error
      }
    } catch (e) {
      // Handle other exceptions, such as network errors
      ("Exception: $e");
      return null; // Or throw an exception if you want to propagate the error
    }
  }
}
