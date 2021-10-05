import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/login/login_controller.dart';
import 'package:weather_app/src/data/repositories/mock_users_repository.dart';
import 'package:weather_app/src/app/pages/home/home_view.dart';

class LoginPage extends View {
  static String route = '/login/';

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState() : super(LoginController(MockUsersRepository()));

  @override
  Widget get view {
    return Scaffold(
      body: Scaffold(
        key:
            globalKey, // built in global key for the ViewState for easy access in the controller
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User',
                      ),
                      onChanged: (String value) => controller.username = value,
                    ),
                  );
                },
              ),
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      onChanged: (String value) => controller.password = value,
                    ),
                  );
                },
              ),
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, HomePage.route),
                    //controller.getUserwithError,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
