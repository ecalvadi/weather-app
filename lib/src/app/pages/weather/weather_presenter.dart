import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/usecases/get_forecast_usecase.dart';

class WeatherPresenter extends Presenter {
  late Function getForecastOnNext;
  late Function getForecastOnComplete;
  late Function getForecastOnError;

  final GetForecastUseCase getForecastUseCase;
  WeatherPresenter(forecastRepo)
      : getForecastUseCase = GetForecastUseCase(forecastRepo);

  void getForecast(String city) {
    getForecastUseCase.execute(
      _GetForecastUseCaseObserver(this),
      GetForecastUseCaseParams(city),
    );
  }

  @override
  void dispose() => getForecastUseCase.dispose();
}

class _GetForecastUseCaseObserver extends Observer<GetForecastUseCaseResponse> {
  final WeatherPresenter presenter;
  _GetForecastUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getForecastOnComplete != null);
    presenter.getForecastOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getForecastOnError != null);
    presenter.getForecastOnError(e);
  }

  @override
  void onNext(GetForecastUseCaseResponse? response) {
    assert(presenter.getForecastOnNext != null);
    presenter.getForecastOnNext(response!.forecast);
  }
}
