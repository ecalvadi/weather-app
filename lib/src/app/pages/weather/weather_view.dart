import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:weather_app/src/app/pages/weather/weather_controller.dart';
import 'package:weather_app/src/data/repositories/dio_weather_repository.dart';

class WeatherPage extends View {
  static String route = '/weather/';

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
        title: const Text("Weather Forecast"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Get Weather Forecast from a Location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 36.0,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ControlledWidgetBuilder<WeatherController>(
              builder: (context, controller) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.red,
                        ),
                        labelText: 'City',
                        hintText:
                            'Write the city of interest, Example: Temuco'),
                    onChanged: (String value) => controller.city = value,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ControlledWidgetBuilder<WeatherController>(
                  builder: (context, controller) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.blueGrey[300]),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 5.0),
                        padding: MaterialStateProperty.resolveWith(
                            (states) => const EdgeInsets.all(15.0)),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                      onPressed: () => controller.getForecast(),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            'Get Weather Forecast',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(Icons.ac_unit),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(width: 14.0),
                ControlledWidgetBuilder<WeatherController>(
                  builder: (context, controller) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.amber[300]),
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 5.0),
                        padding: MaterialStateProperty.resolveWith(
                            (states) => const EdgeInsets.all(15.0)),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                      ),
                      onPressed: () => controller.goHistory(),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'History Page',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(Icons.history, color: Colors.black),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(width: 14.0),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ControlledWidgetBuilder<WeatherController>(
              builder: (context, controller) {
                String description = '';
                String mainTitle = '';
                String img = '';
                double temp = 0.0;
                double windSpeed = 0.0;

                if (controller.forecast != null) {
                  if (controller.forecast!.id != 0) {
                    description =
                        controller.forecast!.weather!.first.description;
                    mainTitle = controller.forecast!.weather!.first.main;
                    img = controller.forecast!.weather!.first.icon;
                    temp = controller.forecast!.main!.temp;
                    windSpeed = controller.forecast!.wind!.speed;
                  }
                }

                return controller.city == ''
                    ? const SizedBox()
                    : Card(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Forecast ${controller.city}: ${mainTitle}',
                                style: const TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: img != ''
                                        ? "http://openweathermap.org/img/wn/${img}@2x.png"
                                        : 'http://openweathermap.org/img/wn/01d@2x.png',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  Text(
                                    'Description: $description\n' +
                                        'Temperature: ${(temp - 273.15).toStringAsFixed(2)} °C' +
                                        '\nWind: ${(windSpeed * 2.237).toStringAsFixed(2)} miles/hour',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ); //controller.forecast!.weather!.first.description;
              },
            ),
          ],
        ),
      ),
    );
  }
}
