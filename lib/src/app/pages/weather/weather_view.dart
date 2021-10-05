import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/weather/weather_controller.dart';

class WeatherPage extends View {
  static String route = '/weather/temuco';

  WeatherPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<WeatherPage, WeatherController> {
  _HomePageState() : super(WeatherController());

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Weather for Temuco"),
      ),
    );
  }
}
