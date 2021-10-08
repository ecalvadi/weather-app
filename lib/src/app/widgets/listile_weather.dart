import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:weather_app/src/domain/entities/forecast.dart';

class ListTileWeather {
  Forecast? _forecast;

  ListTileWeather(this._forecast);

  Widget getWidget() {
    String description = '';
    String mainTitle = '';
    String img = '';
    double temp = 0.0;
    double windSpeed = 0.0;

    if (_forecast != null) {
      if (_forecast!.id != 0) {
        description = _forecast!.weather!.first.description;
        mainTitle = _forecast!.weather!.first.main;
        img = _forecast!.weather!.first.icon;
        temp = _forecast!.main!.temp;
        windSpeed = _forecast!.wind!.speed;
      }
    }

    return _forecast!.id == 0
        ? const SizedBox()
        : Card(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: img != ''
                    ? "http://openweathermap.org/img/wn/${img}@2x.png"
                    : 'http://openweathermap.org/img/wn/01d@2x.png',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(
                'Forecast ${_forecast!.name}: ${mainTitle}',
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
          );
  }
}
