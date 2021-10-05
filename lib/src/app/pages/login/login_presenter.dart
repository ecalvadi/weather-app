import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/usecases/get_user_usecase.dart';

class LoginPresenter extends Presenter {
  late Function getUserOnNext;
  late Function getUserOnComplete;
  late Function getUserOnError;

  final GetUserUseCase getUserUseCase;
  LoginPresenter(usersRepo) : getUserUseCase = GetUserUseCase(usersRepo);

  void getUser(String user) {
    getUserUseCase.execute(
        _GetUserUseCaseObserver(this), GetUserUseCaseParams(user));
  }

  @override
  void dispose() => getUserUseCase.dispose();
}

class _GetUserUseCaseObserver extends Observer<GetUserUseCaseResponse> {
  final LoginPresenter presenter;
  _GetUserUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getUserOnComplete != null);
    presenter.getUserOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getUserOnError != null);
    presenter.getUserOnError(e);
  }

  @override
  void onNext(GetUserUseCaseResponse? response) {
    assert(presenter.getUserOnNext != null);
    presenter.getUserOnNext(response!.user);
  }
}
