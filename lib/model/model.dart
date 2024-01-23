class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  double? tempmin;
  double? tempmax;
  int? sunset;
  int? sunrise;
  

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feels_like,
      this.pressure,
      this.tempmin,
      this.tempmax,
      this.sunset,
     this.sunrise
      });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    tempmin = json["main"]["temp_min"];
    tempmax = json["main"]["temp_max"];
    sunset = json['sys']['sunset'];
    sunrise = json['sys']['sunrise'];
  }
}