import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/entities/forecast.dart';
import 'package:weather_app/src/domain/repositories/forecast_repository.dart';

class SaveForecastUseCase
    extends UseCase<SaveForecastUseCaseResponse, SaveForecastUseCaseParams> {
  final ForecastRepository forecastRepository;
  SaveForecastUseCase(this.forecastRepository);

  @override
  Future<Stream<SaveForecastUseCaseResponse?>> buildUseCaseStream(
      SaveForecastUseCaseParams? params) async {
    final controller = StreamController<SaveForecastUseCaseResponse>();

    try {
      int id = await forecastRepository.saveForecast(params!.forecast);
      if (id != 0) {
        controller.add(SaveForecastUseCaseResponse(true));
      } else {
        controller.add(SaveForecastUseCaseResponse(false));
      }
      logger.finest('SaveForecastUseCase successful.');
    } catch (e) {
      logger.severe('SaveForecastUseCase unsuccessful.!\n $e');
    }
    return controller.stream;
  }
}

class SaveForecastUseCaseParams {
  final Forecast forecast;
  SaveForecastUseCaseParams(this.forecast);
}

class SaveForecastUseCaseResponse {
  final bool isOk;
  SaveForecastUseCaseResponse(this.isOk);
}
