import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';


import 'package:weather_app/src/domain/usecases/get_forecast_history_usecase.dart';


class HistoryPresenter extends Presenter {
  late Function getForecastHistoryOnNext;
  late Function getForecastHistoryOnComplete;
  late Function getForecastHistoryOnError;

  final GetForecastHistoryUseCase getForecastHistoryUseCase;

  HistoryPresenter(forecastRepo)
      : getForecastHistoryUseCase = GetForecastHistoryUseCase(forecastRepo);

  void getForecastHistory() {
    getForecastHistoryUseCase.execute(
      _GetForecastHistoryUseCaseObserver(this),
    );
  }

  @override
  void dispose() => getForecastHistoryUseCase.dispose();
}

class _GetForecastHistoryUseCaseObserver
    extends Observer<GetForecastHistoryUseCaseResponse> {
  final HistoryPresenter presenter;

  _GetForecastHistoryUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getForecastHistoryOnComplete != null);
    presenter.getForecastHistoryOnComplete;
  }

  @override
  void onError(e) {
    assert(presenter.getForecastHistoryOnError != null);
    presenter.getForecastHistoryOnError(e);
  }

  @override
  void onNext(GetForecastHistoryUseCaseResponse? response) {
    assert(presenter.getForecastHistoryOnNext != null);
    presenter.getForecastHistoryOnNext(response!.forecastList);
  }
}
