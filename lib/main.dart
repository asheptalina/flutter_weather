import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/weather/data/data_provider/weather_service.dart';
import 'package:weather_app/weather/data/data_provider/weather_service_network.dart';

void main() {
  GetIt.instance.registerSingleton<WeatherService>(WeatherServiceNetwork());
  runApp(const App());
}