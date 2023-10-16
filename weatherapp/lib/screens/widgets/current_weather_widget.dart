import 'package:flutter/material.dart';
import 'package:weatherapp/model/forecast_model/forecast_model.dart';
import 'package:weatherapp/screens/widgets/forecasy_data_widget.dart';
import 'package:weatherapp/screens/widgets/todays_forecast.dart';
import 'package:weatherapp/utils/constands.dart';
import 'package:weatherapp/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget(
      {super.key,
      // required this.weatherDataCurrent,
      required this.forecastModel});
  // final WeatherDataCurrent weatherDataCurrent;
  final ForecastModel forecastModel;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        temperatureAreaWidget(),
        sbh10,
        feelsLikeWidget(),
        sbh10,
        currentWeatherMoreDetailsWidget(),
        sbh10,
        forecastHeader("Todays Forecast"),
        sbh10,
        TodaysForcastList(
            hourList: forecastModel.forecast!.forecastday![0].hour!),
        sbh10,
        //forecast widget
        forecastHeader("5 Day Forecaste"),
        sbh10,
        ForecastListWidget(forecastday: forecastModel.forecast!.forecastday!)
      ],
    );
  }

  Padding forecastHeader(String title) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ));
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // color: CustomColors.cardColor,
                image: DecorationImage(
                  image:
                      // NetworkImage("https:${weatherDataCurrent.conditionIcon}"),
                      NetworkImage(
                          "https:${forecastModel.current!.condition!.icon}"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              "Feels Like ${forecastModel.current!.feelslikeC!.round()}°",
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerColor,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${forecastModel.current!.tempC!.round()}°",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 80,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            windSpeedTiles("assets/icons/windspeed.png"),
            windSpeedTiles("assets/icons/clouds.png"),
            windSpeedTiles("assets/icons/humidity.png")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            weatherMoreTextWidget(
                "${forecastModel.current!.windKph!.round()}km/h"),
            weatherMoreTextWidget("${forecastModel.current!.cloud!.round()}%"),
            weatherMoreTextWidget(
                "${forecastModel.current!.humidity!.round()}"),
          ],
        )
      ],
    );
  }

  SizedBox weatherMoreTextWidget(String value) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Text(
        value,
        style: const TextStyle(color: Colors.black, fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  Container windSpeedTiles(String image) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(image))),
    );
  }

  Widget feelsLikeWidget() {
    return Center(
      child: Text(
        forecastModel.current!.condition!.text!,
        style: const TextStyle(color: Colors.grey, fontSize: 30),
      ),
    );
  }
}
