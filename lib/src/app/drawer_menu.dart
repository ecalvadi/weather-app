import 'package:flutter/material.dart';

import 'package:weather_app/src/app/pages/weather/weather_view.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            //color: Colors.white,
            gradient: LinearGradient(
              colors: <Color>[
                Colors.yellow[500] as Color,
                Colors.yellow[600] as Color,
                Colors.yellow[700] as Color,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'Welcome!',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListTile(
            leading: const Icon(Icons.ac_unit),
            title: const Text('Weather Forecast'),
            onTap: () {
              Navigator.of(context).pushNamed(WeatherPage.route);
            },
          ),
        ),
      ],
    ));
  }
}
