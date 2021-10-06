import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:weather_app/src/domain/entities/forecast.dart';
import 'package:weather_app/src/domain/repositories/forecast_repository.dart';
//http://api.openweathermap.org/data/2.5/weather?q=Temuco,cl&APPID=b5245cd9e0962e3e345f74872968d116
//class DioWeatherRepository
//Instalar Hive

class DioWeatherRepository extends ForecastRepository {
  @override
  Future<Forecast> getForecast() async {
    late Forecast forecast;

    try {
      var response = await Dio().get(
          "http://api.openweathermap.org/data/2.5/weather?q=Temuco,cl&APPID=b5245cd9e0962e3e345f74872968d116");
      print(response.statusCode);
      if (response.statusCode == 200) {
        forecast = Forecast.fromJson(response.data);
      } else {
        forecast = Forecast(id: 0);
      }
    } catch (e) {
      print(e);
      forecast = Forecast(id: 0);
    }
    return forecast;
  }
}
