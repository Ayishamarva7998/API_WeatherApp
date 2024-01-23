import 'dart:convert';
import 'dart:developer';


import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/model/model.dart';

import 'package:http/http.dart' as http;

class WeatherService {
  Future<Weather?> fetchWeatherDataByCity(String city) async {
    try {
      final String apiUrl =
          // ignore: unnecessary_brace_in_string_interps
          '${APIEndpoints().cityUrl}${city}&appid=${APIEndpoints().apikey}${APIEndpoints().units}';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('$data');
        return Weather.fromJson(data);
      } else { 
        
        log('Error:${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Exception:$e');
      return null;
    }
  }
}
