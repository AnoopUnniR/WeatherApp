class WeatherDataCurrent {
  final String name;
  final String region;
  final String country;
  final double latitude;
  final double longitude;
  final String timezoneId;
  final int localTimeEpoch;
  final String localTime;
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final int temperatureCelsius;
  final double temperatureFahrenheit;
  final int isDay;
  final String conditionText;
  final String conditionIcon;
  final int conditionCode;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDirection;
  final double pressureMb;
  final double pressureInches;
  final double precipMm;
  final double precipInches;
  final int humidity;
  final int cloudCover;
  final double feelsLikeCelsius;
  final double feelsLikeFahrenheit;
  final double visibilityKm;
  final double visibilityMiles;
  final double uvIndex;
  final double windGustMph;
  final double windGustKph;

  WeatherDataCurrent({
    required this.name,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.timezoneId,
    required this.localTimeEpoch,
    required this.localTime,
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.temperatureCelsius,
    required this.temperatureFahrenheit,
    required this.isDay,
    required this.conditionText,
    required this.conditionIcon,
    required this.conditionCode,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDirection,
    required this.pressureMb,
    required this.pressureInches,
    required this.precipMm,
    required this.precipInches,
    required this.humidity,
    required this.cloudCover,
    required this.feelsLikeCelsius,
    required this.feelsLikeFahrenheit,
    required this.visibilityKm,
    required this.visibilityMiles,
    required this.uvIndex,
    required this.windGustMph,
    required this.windGustKph,
  });

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherDataCurrent(
      name: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      latitude: json['location']['lat'].toDouble(),
      longitude: json['location']['lon'].toDouble(),
      timezoneId: json['location']['tz_id'],
      localTimeEpoch: json['location']['localtime_epoch'],
      localTime: json['location']['localtime'],
      lastUpdatedEpoch: json['current']['last_updated_epoch'],
      lastUpdated: json['current']['last_updated'],
      temperatureCelsius: json['current']['temp_c'].round(),
      temperatureFahrenheit: json['current']['temp_f'].toDouble(),
      isDay: json['current']['is_day'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      conditionCode: json['current']['condition']['code'],
      windMph: json['current']['wind_mph'].toDouble(),
      windKph: json['current']['wind_kph'].toDouble(),
      windDegree: json['current']['wind_degree'],
      windDirection: json['current']['wind_dir'],
      pressureMb: json['current']['pressure_mb'].toDouble(),
      pressureInches: json['current']['pressure_in'].toDouble(),
      precipMm: json['current']['precip_mm'].toDouble(),
      precipInches: json['current']['precip_in'].toDouble(),
      humidity: json['current']['humidity'],
      cloudCover: json['current']['cloud'],
      feelsLikeCelsius: json['current']['feelslike_c'].toDouble(),
      feelsLikeFahrenheit: json['current']['feelslike_f'].toDouble(),
      visibilityKm: json['current']['vis_km'].toDouble(),
      visibilityMiles: json['current']['vis_miles'].toDouble(),
      uvIndex: json['current']['uv'].toDouble(),
      windGustMph: json['current']['gust_mph'].toDouble(),
      windGustKph: json['current']['gust_kph'].toDouble(),
    );
  }
}
