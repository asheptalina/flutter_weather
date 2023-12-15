part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {

  final String error;

  const WeatherErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class WeatherSuccessState extends WeatherState {

  final Weather weather;

  const WeatherSuccessState({required this.weather});

  @override
  List<Object> get props => [weather];
}
