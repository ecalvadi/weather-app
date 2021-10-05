import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/login/login_controller.dart';
import 'package:weather_app/src/data/repositories/mock_users_repository.dart';

class LoginPage extends View {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginController> {
  _LoginPageState() : super(LoginController(MockUsersRepository()));

  @override
  Widget get view {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        key:
            globalKey, // built in global key for the ViewState for easy access in the controller
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return Text(
                    'Button pressed ${controller.counter} times.',
                  );
                },
              ),
              Text(
                'The current user is',
              ),
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return Text(
                    controller.user == null ? '' : '${controller.user}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return ElevatedButton(
                    onPressed: controller.getUser,
                    child: Text(
                      'Get User',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
              ControlledWidgetBuilder<LoginController>(
                builder: (context, controller) {
                  return ElevatedButton(
                    onPressed: controller.getUserwithError,
                    child: Text(
                      'Get User Error',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ControlledWidgetBuilder<LoginController>(
        builder: (context, controller) {
          return FloatingActionButton(
            onPressed: () => controller.buttonPressed(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}
