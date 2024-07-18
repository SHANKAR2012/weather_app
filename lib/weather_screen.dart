import 'dart:convert';
import 'dart:ui';
import 'package:weather_app/additional_info_item.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/weather_screen.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api.env';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late double temp = 0;


  Future<void> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$api_key'),
      );

      final jsonData = jsonDecode(response.body);

      // jsonData['list'][0]['main']['temp'] ;
    } catch (e) {
      print('Error: $e');
    }
  }

  void refresh() {
    print('refresh');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: refresh, icon: const Icon(Icons.refresh_sharp))
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '$temp K  ',
                                  style: const TextStyle(
                                    fontSize: 32,
                                  ),
                                ),
                                const Icon(Icons.cloud, size: 64),
                                const Text(
                                  'Rain',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),

                const Text(
                  'Weather Forecast',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                //weather forecast

                const SizedBox(height: 0),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: HourlyForecastItems(
                            icon: Icons.sunny, time: '10:00', value: '301.16'),
                      ),
                      SizedBox(
                        width: 100,
                        child: HourlyForecastItems(
                            icon: Icons.cloud, time: '11:00', value: '301.16'),
                      ),
                      SizedBox(
                        width: 100,
                        child: HourlyForecastItems(
                            icon: Icons.cloud, time: '12:00', value: '301.16'),
                      ),
                      SizedBox(
                        width: 100,
                        child: HourlyForecastItems(
                            icon: Icons.cloud, time: '03:00', value: '301.16'),
                      ),
                      SizedBox(
                        width: 100,
                        child: HourlyForecastItems(
                            icon: Icons.water_drop,
                            time: '05:00',
                            value: '275.16'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInfoItem(
                        icon: Icons.water_drop, label: 'Humidity', value: '91'),
                    AdditionalInfoItem(
                        icon: Icons.wind_power,
                        label: 'Wind Speed',
                        value: '7.5'),
                    AdditionalInfoItem(
                        icon: Icons.beach_access,
                        label: 'Pressure',
                        value: '1000'),
                  ],
                ),

                //additional information
              ],
            ),
          );
        }
      ),
    );
  }

}
