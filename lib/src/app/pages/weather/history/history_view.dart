import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/weather/history/history_controller.dart';
import 'package:weather_app/src/data/repositories/dio_weather_repository.dart';

class HistoryPage extends View {
  static String route = '/weather/history';

  HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends ViewState<HistoryPage, HistoryController> {
  _HistoryPageState() : super(HistoryController(DioWeatherRepository()));

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text("Weather History"),
      ),
      body: ControlledWidgetBuilder<HistoryController>(
        builder: (context, controller) {
          return ListView(
            children: controller.getHistoryList(),
          );
        },
      ),
      floatingActionButton: ControlledWidgetBuilder<HistoryController>(
        builder: (context, controller) {
          return FloatingActionButton(
            child: Icon(Icons.update),
            onPressed: () {
              controller.getHistory();
            },
          );
        },
      ),
    );
  }
}
