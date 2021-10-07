import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/weather/weather_presenter.dart';
import 'package:weather_app/src/domain/entities/forecast.dart';

class WeatherController extends Controller {
  String _city = '';
  Forecast? _forecast;

  Forecast? get forecast => _forecast;
  String get city => _city;
  void set city(String cityName) => _city = cityName;

  final WeatherPresenter weatherPresenter;

  WeatherController(forecastRepo)
      : weatherPresenter = WeatherPresenter(forecastRepo),
        super();

  @override
  void initListeners() {
    weatherPresenter.getForecastOnNext = (Forecast forecast) {
      print(forecast.id);
      _forecast = forecast;
      if (forecast.id != 0) weatherPresenter.saveForecast(forecast);
      refreshUI();
    };

    weatherPresenter.saveForecastOnNext = (bool forecast) {
      if (forecast) {
        ScaffoldMessenger.of(getContext()).showSnackBar(
          SnackBar(
            content: Text('The ${_city} has been saved correctly'),
          ),
        );
        refreshUI();
      }
    };

    weatherPresenter.getForecastOnComplete = () {
      print('Forecast Retriverd');
      refreshUI();
    };

    weatherPresenter.saveForecastOnComplete =
        () => print('Forecast saved correctly.');

    weatherPresenter.saveForecastOnError = (e) {
      print('Could not save forecast.');
      ScaffoldMessenger.of(getContext()).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
      refreshUI();
    };
  }

  void getForecast() {
    weatherPresenter.getForecast(_city);
    refreshUI();
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    weatherPresenter.dispose();
    super.onDisposed();
  }
}
