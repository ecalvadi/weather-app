import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/login/login_presenter.dart';
import 'package:weather_app/src/domain/entities/user.dart';

class LoginController extends Controller {
  User _user;
  User get user => _user;

  final LoginPresenter loginPresenter;

  LoginController(usersRepo) : loginPresenter = LoginPresenter(usersRepo), super();
}