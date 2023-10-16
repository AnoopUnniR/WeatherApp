import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/api/weather_service.dart';
import 'package:weatherapp/model/weather_data.dart';

class GlobalControl extends GetxController {
  //variables needed to update the state
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  RxBool checkLoading() => isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;

  // final weatherData = WeatherData().obs;
  // WeatherData getWeatherData() {
  //   return weatherData.value;
  // }

  final forecastData = ForecastData().obs;
  ForecastData getForecastData() {
    return forecastData.value;
  }

  @override
  void onInit() {
    if (isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    //checking status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location persmission denied forever!");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Presmission denied");
      }
    }

    //getting current position of user
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update our latitude
      longitude.value = value.longitude;
      latitude.value = value.latitude;
      //calling weather api
      return FetchForecastWeather()
          .processData(value.latitude, value.longitude)
          .then(
              (value) => {forecastData.value = value, isLoading.value = false});
      // FetchWeatherApi().processData(value.latitude, value.longitude).then(
      //     (value) => {weatherData.value = value, isLoading.value = false});
    });
  }
}
