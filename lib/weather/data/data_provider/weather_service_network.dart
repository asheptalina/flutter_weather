import 'package:dio/dio.dart';
import 'package:weather_app/weather/data/data_provider/model/current_weather_model.dart';
import 'package:weather_app/weather/data/data_provider/weather_service.dart';

class WeatherServiceNetwork implements WeatherService {

  final dio = Dio();

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String cityName) async {
    final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json',
        queryParameters: {
          'key': '89aeba8e60fa41f6a5d124106231312',
          'q': cityName,
          'lang': 'ru'
        }
    );
    return CurrentWeatherModel.fromJson(response.data);
  }

}