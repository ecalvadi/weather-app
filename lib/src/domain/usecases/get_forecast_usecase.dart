import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/entities/forecast.dart';
import 'package:weather_app/src/domain/repositories/forecast_repository.dart';

class GetForecastUseCase
    extends UseCase<GetForecastUseCaseResponse, GetForecastUseCaseParams> {
  final ForecastRepository forecastRepository;
  GetForecastUseCase(this.forecastRepository);

  @override
  Future<Stream<GetForecastUseCaseResponse?>> buildUseCaseStream(
    GetForecastUseCaseParams? params,
  ) async {
    final controller = StreamController<GetForecastUseCaseResponse>();
    print(params!.city);
    try {
      //TODO: pass city in the future
      final Forecast forecast = await forecastRepository.getForecast();
      print('The Forecast id is: ${forecast.id}');
      controller.add(GetForecastUseCaseResponse(forecast));
      logger.finest('GetForecastUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetForecastUseCase unsuccessful!!!. :(');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetForecastUseCaseParams {
  final String city;
  GetForecastUseCaseParams(this.city);
}

class GetForecastUseCaseResponse {
  final Forecast forecast;
  GetForecastUseCaseResponse(this.forecast);
}
