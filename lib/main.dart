import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:weather_app/src/app.dart';
import 'package:weather_app/src/domain/entities/cloud.dart';
import 'package:weather_app/src/domain/entities/coord.dart';
import 'package:weather_app/src/domain/entities/forecast.dart';
import 'package:weather_app/src/domain/entities/weather.dart';
import 'package:weather_app/src/domain/entities/weather_main.dart';
import 'package:weather_app/src/domain/entities/wind.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ForecastAdapter());
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(WindAdapter());
  Hive.registerAdapter(WeatherMainAdapter());
  Hive.registerAdapter(CoordAdapter());
  Hive.registerAdapter(CloudAdapter());

  runApp(App());
}
