import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weather_app/src/app/drawer_menu.dart';

import 'package:weather_app/src/app/pages/home/home_controller.dart';

class HomePage extends View {
  static String route = '/home/';

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState() : super(HomeController());

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Welcome!"),
      ),
      drawer: DrawerMenu(),
    );
  }
}
