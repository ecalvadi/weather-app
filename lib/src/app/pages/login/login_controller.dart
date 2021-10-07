import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/login/login_presenter.dart';
import 'package:weather_app/src/domain/entities/user.dart';
import 'package:weather_app/src/app/pages/home/home_view.dart';

class LoginController extends Controller {
  late int _counter;
  User? _user;
  String? _username;
  String? _userpass;

  void set username(String username) => _username = username;
  void set password(String password) => _userpass = password;

  int get counter => _counter;
  User? get user => _user;

  final LoginPresenter loginPresenter;

  LoginController(usersRepo)
      : _counter = 0,
        loginPresenter = LoginPresenter(usersRepo),
        super();

  @override
  void initListeners() {
    loginPresenter.getUserOnNext = (User user) {
      print(user);
      _user = user;
      if (_user != null) {
        if (_user!.user == _username! && _user!.pass == _userpass!) {
          Navigator.pushReplacementNamed(getContext(), HomePage.route);
        }
      }
      //refreshUI();
    };

    loginPresenter.getUserOnComplete = () => print('User Retrieved');

    loginPresenter.getUserOnError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _user = null;
      refreshUI();
    };
  }

  void getUser(BuildContext context) {
    if (_username != null) {
      loginPresenter.getUser(_username!);
    }
  }

  void getUserwithError() => loginPresenter.getUser('test-asdasd');

  void buttonPressed() {
    _counter++;
    refreshUI();
  }

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    loginPresenter.dispose();
    super.onDisposed();
  }
}
