import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/usecases/get_forecast_usecase.dart';
import 'package:weather_app/src/domain/usecases/save_forecast_usecase.dart';
import 'package:weather_app/src/domain/entities/forecast.dart';

class WeatherPresenter extends Presenter {
  late Function getForecastOnNext;
  late Function getForecastOnComplete;
  late Function getForecastOnError;
  late Function saveForecastOnNext;
  late Function saveForecastOnComplete;
  late Function saveForecastOnError;

  final GetForecastUseCase getForecastUseCase;
  final SaveForecastUseCase saveForecastUseCase;
  WeatherPresenter(forecastRepo)
      : getForecastUseCase = GetForecastUseCase(forecastRepo),
        saveForecastUseCase = SaveForecastUseCase(forecastRepo);

  void getForecast(String city) {
    getForecastUseCase.execute(
      _GetForecastUseCaseObserver(this),
      GetForecastUseCaseParams(city),
    );
  }

  void saveForecast(Forecast forecast) {
    saveForecastUseCase.execute(
      _SaveForecastUseCaseObserver(this),
      SaveForecastUseCaseParams(forecast),
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

class _SaveForecastUseCaseObserver
    extends Observer<SaveForecastUseCaseResponse> {
  final WeatherPresenter presenter;
  _SaveForecastUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.saveForecastOnComplete != null);
    presenter.saveForecastOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.saveForecastOnError != null);
    presenter.saveForecastOnError(e);
  }

  @override
  void onNext(SaveForecastUseCaseResponse? response) {
    assert(presenter.saveForecastOnNext != null);
    presenter.saveForecastOnNext(response!.isOk);
  }
}
