import 'package:flutter/material.dart';
import 'package:weather_app/weather/data/model/weather.dart';

class WeatherWidget extends StatelessWidget {

  final Weather weather;
  final VoidCallback onRefreshWeather;

  const WeatherWidget({
    required this.weather,
    required this.onRefreshWeather,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Text('${weather.temperature}°', style: textTheme.displayMedium),
                  Text(weather.description, style: textTheme.titleLarge),
                  Text('Влажность ${weather.humidity}%'),
                  Text('Ветер ${weather.windSpeed} км/ч'),
                  Text('Ощущается как ${weather.feelsLikeTemperature}°')
                ],
              )
          ),
          FilledButton.tonal(
            onPressed: onRefreshWeather,
            child: const Text('Получить погоду в Москве'),
          )
        ],
      ),
    );
  }
}
