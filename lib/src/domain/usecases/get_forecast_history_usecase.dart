import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/entities/forecast.dart';
import 'package:weather_app/src/domain/repositories/forecast_repository.dart';

class GetForecastHistoryUseCase extends UseCase<GetForecastHistoryUseCaseResponse, GetForecastHistoryUseCaseResponse> {
  final ForecastRepository forecastRepository;
  GetForecastHistoryUseCase(this.forecastRepository);

  @override
  Future<Stream<GetForecastHistoryUseCaseResponse?>> buildUseCaseStream(GetForecastHistoryUseCaseResponse? params) async {
    final controller = StreamController<GetForecastHistoryUseCaseResponse>();

    try {
      List<Forecast> forecastList = await forecastRepository.getHistory();
      forecastList.forEach((element) => print(element.toJson().toString()));
      controller.add(GetForecastHistoryUseCaseResponse(forecastList));
      
      logger.finest('GetForecastHistoryUseCase successful');
    } catch (e) {
      logger.severe('GetForecastHistoryUseCase unsuccessful.!\n$e');
    }

    return controller.stream;
  }
}

class GetForecastHistoryUseCaseParams {

}

class GetForecastHistoryUseCaseResponse {
  final List<Forecast> forecastList;
  GetForecastHistoryUseCaseResponse(this.forecastList);
}