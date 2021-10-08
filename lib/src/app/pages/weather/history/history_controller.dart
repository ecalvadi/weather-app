import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/weather/history/history_presenter.dart';
import 'package:weather_app/src/app/widgets/listile_weather.dart';
import 'package:weather_app/src/domain/entities/forecast.dart';

class HistoryController extends Controller {
  List<Forecast>? _forecastList;

  List<Forecast>? get forecast => _forecastList;

  final HistoryPresenter historyPresenter;

  HistoryController(forecastRepo)
      : historyPresenter = HistoryPresenter(forecastRepo),
        super();

  @override
  void initListeners() {
    historyPresenter.getForecastHistoryOnNext = (List<Forecast> forecastList) {
      _forecastList = forecastList;
      refreshUI();
    };

    historyPresenter.getForecastHistoryOnComplete = () {
      print('History retrieved.');
      refreshUI();
    };

    historyPresenter.getForecastHistoryOnError = (e) {
      print('Could not save forecast');
      ScaffoldMessenger.of(getContext()).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
      refreshUI();
    };
  }

  void getHistory() {
    historyPresenter.getForecastHistory();
    refreshUI();
  }

  List<Widget> getHistoryList() {
    List<Widget> list = <Widget>[];

    if (_forecastList != null) {
      _forecastList!.reversed.forEach(
        (e) {
          list.add(
            ListTileWeather(e).getWidget(),
          );
        },
      );
    }
    return list;
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    historyPresenter.dispose();
    super.onDisposed();
  }
}
