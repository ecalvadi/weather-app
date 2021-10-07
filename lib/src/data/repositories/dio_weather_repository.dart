import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import 'package:weather_app/src/domain/entities/forecast.dart';
import 'package:weather_app/src/domain/repositories/forecast_repository.dart';
//http://api.openweathermap.org/data/2.5/weather?q=Temuco,cl&APPID=b5245cd9e0962e3e345f74872968d116
//class DioWeatherRepository
//Instalar Hive

class DioWeatherRepository extends ForecastRepository {
  @override
  Future<Forecast> getForecast(String? city) async {
    late Forecast forecast;

    if (city != '') {
      try {
        var response = await Dio().get(
            "http://api.openweathermap.org/data/2.5/weather?q=${city!}&APPID=b5245cd9e0962e3e345f74872968d116");
        print(response.statusCode);
        if (response.statusCode == 200) {
          print(response.data);
          forecast = Forecast.fromJson(response.data);
        } else {
          forecast = Forecast(id: 0);
        }
      } catch (e) {
        print(e);
        forecast = Forecast(id: 0);
      }
    } else
      forecast = Forecast(id: 0);
    return forecast;
  }

  @override
  Future<int> saveForecast(Forecast forecast) async {
    var foreData = await Hive.openBox<Forecast>('forecast');
    return await foreData.add(forecast);
  }

  @override
  Future<List<Forecast>> getHistory() async {
    var foreData = await Hive.openBox<Forecast>('forecast');
    return foreData.values.toList();
  }
}
