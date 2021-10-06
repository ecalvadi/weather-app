import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/weather/weather_presenter.dart';
import 'package:weather_app/src/domain/entities/forecast.dart';

class WeatherController extends Controller {
  static String city = 'Temuco';
  Forecast? _forecast;

  Forecast? get forecast => _forecast;

  final WeatherPresenter weatherPresenter;

  WeatherController(forecastRepo)
      : weatherPresenter = WeatherPresenter(forecastRepo),
        super();

  @override
  void initListeners() {
    weatherPresenter.getForecastOnNext = (Forecast forecast) {
      print(forecast.id);
      _forecast = forecast;
      refreshUI();
    };

    weatherPresenter.getForecastOnComplete = () {
      print('Forecast Retriverd');
      refreshUI();
    };

    weatherPresenter.getForecastOnError = (e) {
      print('Could not retrieve forecast.');
      ScaffoldMessenger.of(getContext()).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
      _forecast = null;
      refreshUI();
    };
  }

  void getForecast() {
    weatherPresenter.getForecast(city);
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
