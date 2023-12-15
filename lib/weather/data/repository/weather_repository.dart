import 'package:weather_app/weather/data/data_provider/model/current_weather_model.dart';
import 'package:weather_app/weather/data/model/weather.dart';
import 'package:weather_app/weather/data/data_provider/weather_service.dart';

class WeatherRepository {

  final WeatherService weatherService;

  const WeatherRepository({required this.weatherService});

  Future<Weather> getCurrentWeather(String cityName) async {
    final result = await weatherService.getCurrentWeather(cityName);
    return result.toWeather();
  }
}

extension CurrentWeatherModelConverter on CurrentWeatherModel {
  Weather toWeather() {
    return Weather(
        temperature: current.tempC,
        feelsLikeTemperature: current.feelslikeC,
        windSpeed: current.windKph,
        humidity: current.humidity,
        description: current.condition.text
    );
  }
}