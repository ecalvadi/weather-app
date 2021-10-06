import 'package:weather_app/src/domain/entities/forecast.dart';

abstract class ForecastRepository {
  Future<Forecast> getForecast();
}
