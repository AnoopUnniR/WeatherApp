import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

part 'forecast_model.g.dart';

@JsonSerializable()
class ForecastModel {
	Location? location;
	Current? current;
	Forecast? forecast;

	ForecastModel({this.location, this.current, this.forecast});

	factory ForecastModel.fromJson(Map<String, dynamic> json) {
		return _$ForecastModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
