import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
            const Text(
              'Get Weather Forecast from a Location',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
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
            ControlledWidgetBuilder<WeatherController>(
              builder: (context, controller) {
                return ElevatedButton(
                  onPressed: () => controller.getForecast(),
                  child: const Text(
                    'Get Weather Forecast',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            ControlledWidgetBuilder<WeatherController>(
              builder: (context, controller) {
                return ElevatedButton(
                  onPressed: () => controller.goHistory(),
                  child: const Text(
                    'History Page',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
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
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: img != ''
                                ? "http://openweathermap.org/img/wn/${img}@2x.png"
                                : 'http://openweathermap.org/img/wn/01d@2x.png',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          title: Text(
                            'Forecast ${controller.city}: ${mainTitle}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Description: $description\n' +
                                'Temperature: ${(temp - 273.15).toStringAsFixed(2)} °C' +
                                '\nWind: ${(windSpeed * 2.237).toStringAsFixed(2)} miles/hour',
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
