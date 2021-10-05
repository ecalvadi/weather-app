import 'package:flutter/material.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/login/login_view.dart';
import 'package:weather_app/src/app/utils/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.route,
      routes: MyRoutes().routes,
    );
  }
}
