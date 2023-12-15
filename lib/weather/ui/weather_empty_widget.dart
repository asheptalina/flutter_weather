import 'package:flutter/material.dart';

class WeatherEmptyWidget extends StatelessWidget {

  final VoidCallback onGetWeather;

  const WeatherEmptyWidget({required this.onGetWeather, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton.tonal(
        onPressed: onGetWeather,
        child: const Text('Получить погоду в Москве'),
      ),
    );
  }
}
