import 'package:flutter/material.dart';
import 'package:weatherapp/model/forecast_model/forecastday.dart';

class ForecastListWidget extends StatelessWidget {
  const ForecastListWidget({super.key, required this.forecastday});
  final List<Forecastday> forecastday;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: forecastday.length,
      itemBuilder: (context, index) {
        Forecastday forecast = forecastday[index];
        return ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https:${forecast.day!.condition!.icon}"),
              ),
            ),
          ),
          title: Text(forecast.date!.split("-").reversed.join("-")),
          subtitle: Text(forecast.day!.condition!.text!),
          trailing: Text(
            "${forecast.day!.maxtempC!.round()}° - ${forecast.day!.mintempC!.round()}°",
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}
