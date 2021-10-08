import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:weather_app/src/app/pages/login/login_controller.dart';
import 'package:weather_app/src/data/repositories/mock_users_repository.dart';

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
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[500],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, left: 10.0, right: 10.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70.0, right: 70.0, bottom: 10.0),
                        child: CachedNetworkImage(
                            imageUrl:
                                'http://clipart-library.com/images_k/transparent-weather/transparent-weather-11.png'),
                      ),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Please complete the login form',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        ControlledWidgetBuilder<LoginController>(
                          builder: (context, controller) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(),
                                  ),
                                  labelText: 'User',
                                  hintText: 'Enter your user',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey, fontFamily: 'Nunito'),
                                  suffixIcon: Icon(Icons.account_circle_rounded,
                                      color: Colors.blue[500]),
                                ),
                                onChanged: (String value) =>
                                    controller.username = value,
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(),
                                  ),
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontFamily: 'Nunito'),
                                  suffixIcon: Icon(Icons.password,
                                      color: Colors.blue[500]),
                                ),
                                onChanged: (String value) =>
                                    controller.password = value,
                              ),
                            );
                          },
                        ),
                        ControlledWidgetBuilder<LoginController>(
                          builder: (context, controller) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.blue[500]),
                                  elevation: MaterialStateProperty.resolveWith(
                                      (states) => 5.0),
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => const EdgeInsets.all(15.0)),
                                  shape: MaterialStateProperty.resolveWith(
                                    (states) => RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                ),
                                onPressed: () {
                                  controller.getUser(context);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Login ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17.0,
                                          fontFamily: 'Nunito'),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.login,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
