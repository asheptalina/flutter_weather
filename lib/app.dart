import 'package:flutter/material.dart';
import 'package:weather_app/weather/ui/weather_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WeatherPage(),
    );
  }
}
