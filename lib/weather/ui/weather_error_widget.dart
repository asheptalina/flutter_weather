import 'package:flutter/material.dart';

class WeatherErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onGetWeather;

  const WeatherErrorWidget({
    required this.errorMessage,
    required this.onGetWeather,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          FilledButton.tonal(
            onPressed: onGetWeather,
            child: const Text('Получить погоду в Москве'),
          )
        ],
      ),
    );
  }
}
