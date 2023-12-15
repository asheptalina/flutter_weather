import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/weather/bloc/weather_cubit.dart';
import 'package:weather_app/weather/data/data_provider/weather_service.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';
import 'package:weather_app/weather/ui/weather_empty_widget.dart';
import 'package:weather_app/weather/ui/weather_error_widget.dart';
import 'package:weather_app/weather/ui/weather_loading_widget.dart';
import 'package:weather_app/weather/ui/weather_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc Weather App'),
      ),
      body: RepositoryProvider(
        create: (context) => WeatherRepository(weatherService: GetIt.instance.get<WeatherService>()),
        child: BlocProvider(
            create: (context) =>
                WeatherCubit(weatherRepository: RepositoryProvider.of<WeatherRepository>(context)),
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                return switch (state) {
                  WeatherEmptyState() => WeatherEmptyWidget(onGetWeather: () => _getWeather(context)),
                  WeatherLoadingState() => const WeatherLoadingWidget(),
                  WeatherErrorState() => WeatherErrorWidget(
                    errorMessage: state.error,
                    onGetWeather: () => _getWeather(context)
                  ),
                  WeatherSuccessState() => WeatherWidget(
                    weather: state.weather,
                    onRefreshWeather: () => _getWeather(context)
                  )
                };
              }
            )
        ),
      )
    );
  }

  void _getWeather(BuildContext context) {
    context.read<WeatherCubit>().fetchWeatherData('Moscow');
  }
}
