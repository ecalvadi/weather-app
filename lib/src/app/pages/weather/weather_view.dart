import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/app/pages/weather/weather_controller.dart';
import 'package:weather_app/src/data/repositories/dio_weather_repository.dart';

class WeatherPage extends View {
  static String route = '/weather/temuco';

  WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends ViewState<WeatherPage, WeatherController> {
  _WeatherPageState() : super(WeatherController(DioWeatherRepository()));

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Weather for Temuco"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ControlledWidgetBuilder<WeatherController>(
                builder: (context, controller) {
              String description = controller.forecast == null
                  ? ''
                  : controller.forecast!.weather!.first.description;
              return Card(
                child: ListTile(
                  title: Text(
                    'Forecast Temuco',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Description: $description\n'),
                ),
              );
            }),
            ControlledWidgetBuilder<WeatherController>(
              builder: (context, controller) {
                return ElevatedButton(
                  onPressed: () => controller.getForecast(),
                  child: Text(
                    'Get Forecast for Temuco',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
