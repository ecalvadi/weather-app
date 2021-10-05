import 'package:flutter/material.dart';

import 'package:weather_app/src/app/pages/login/login_view.dart';
import 'package:weather_app/src/app/pages/home/home_view.dart';
import 'package:weather_app/src/app/pages/weather/weather_view.dart';

class MyRoutes {
  final Map<String, WidgetBuilder> _routes = {
    LoginPage.route: (content) => LoginPage(),
    HomePage.route: (content) => HomePage(),
    WeatherPage.route: (content) => WeatherPage(),
  };

  Map<String, WidgetBuilder> get routes => _routes;
}
