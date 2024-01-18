import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:http/http.dart.' as http;

class WeatherServiceProvider extends ChangeNotifier {
  Weather? _weather;
  Weather? get weather => _weather;
  bool _isloading = false;
  bool get isloading => _isloading;

  String _error = "";
  String get errors => _error;

  Future<void> WeatherDataByCity(String city) async {
    _isloading = true;
    _error = "";

    try {
      final String apiUrl =
          "${APIEndpoints().cityUrl}${city}&appid=${APIEndpoints().apikey}${APIEndpoints().units}";
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        _weather = Weather.fromJson(data);
        // print(_weather!.cityName);
        notifyListeners();
      } else {
        _error = "failed to load data";
      }
    } catch (e) {
      _error = "failed to load data $e";
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}