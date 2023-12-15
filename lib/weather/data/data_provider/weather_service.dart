import 'package:weather_app/weather/data/data_provider/model/current_weather_model.dart';

abstract class WeatherService {
  Future<CurrentWeatherModel> getCurrentWeather(String cityName);
}