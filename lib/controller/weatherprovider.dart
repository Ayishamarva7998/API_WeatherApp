import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:flutter_application_1/services/weather_service_p.dart';


class WeatherProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  Weather? weather;

  final WeatherService weatherService = WeatherService();
  Future<Weather?> fetchWeatherDataByCity(city) async {
    isLoading = true;
    notifyListeners();
    try {
      weather = await weatherService.fetchWeatherDataByCity(city);
    } catch (e) {
      log('Exception occurred while fetching weather: $e');

      weather = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return weather;
  }

  searchCity(BuildContext context) async {
    await fetchWeatherDataByCity(searchController.text.trim());
    searchController.clear();
    notifyListeners();
  }
}
