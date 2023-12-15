import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/weather/data/model/weather.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {

  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super(WeatherEmptyState());

  Future<void> fetchWeatherData(String cityName) async {
    emit(WeatherLoadingState());
    try {
      final weather = await weatherRepository.getCurrentWeather(cityName);
      emit(WeatherSuccessState(weather: weather));
    } catch (error) {
      debugPrint(error.toString());
      emit(const WeatherErrorState(error: 'Не удалось получить погоду'));
    }
  }
}
