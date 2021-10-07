import 'package:weather_app/src/domain/entities/forecast.dart';

abstract class ForecastRepository {
  Future<Forecast> getForecast(String? city);
  Future<int> saveForecast(Forecast forecast);
  Future<List<Forecast>> getHistory();
}
