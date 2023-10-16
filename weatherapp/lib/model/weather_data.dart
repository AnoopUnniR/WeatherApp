import 'package:weatherapp/model/forecast_model/forecast_model.dart';
import 'package:weatherapp/model/weather_data_current_model.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);

  WeatherDataCurrent getCurrentWeather() => current!;
}

class ForecastData {
  final ForecastModel? forecastModel;

  ForecastData([this.forecastModel]);
  ForecastModel getForecastmodel() => forecastModel!;
}
