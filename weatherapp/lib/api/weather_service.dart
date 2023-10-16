import 'dart:convert';

import 'package:weatherapp/api/api_key.dart';
import 'package:weatherapp/model/forecast_model/forecast_model.dart';
// import 'package:weatherapp/model/forecast/forecast.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_data_current_model.dart';

class FetchWeatherApi {
  WeatherData? weatherData;
  //to json
  Future<WeatherData> processData(lat, lon) async {
    final response = await http.get(Uri.parse(apiUrl(lat, lon)));
    final jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

String apiUrl(lat, lon) {
  return "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$lat,$lon";
}

String apiUrlForecast(lat, lon) {
  return "http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$lat,$lon&days=5";
}

class FetchForecastWeather {
  ForecastData? forecast;
  Future<ForecastData> processData(lat, lon) async {
    final response = await http.get(Uri.parse(apiUrlForecast(lat, lon)));
    final jsonString = jsonDecode(response.body);
    forecast = ForecastData(ForecastModel.fromJson(jsonString));
    return forecast!;
  }
}
