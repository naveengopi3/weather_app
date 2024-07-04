import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/components/weather_details_ui.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;
  const WeatherDetailsScreen({super.key, required this.cityName});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();

  static Widget getWeatherIcon(String condition) {
    switch (condition) {
      case 'Clear':
        return Image.asset('assets/img/clear.png');
      case 'Clouds':
        return Image.asset('assets/img/clouds.png');
      case 'Rain':
        return Image.asset('assets/img/rain.png');
      case 'Snow':
        return Image.asset('assets/img/snow.png');
      case 'Thunderstorm':
        return Image.asset('assets/img/thunder.png');
      default:
        return Image.asset('assets/img/default.png');
    }
  }
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  late Future<Weather> weatherFuture;

  @override
  void initState() {
    super.initState();
    weatherFuture = WeatherServices().fetchWeather(widget.cityName);
    _saveLastSearchedCity(widget.cityName);
  }

  void _saveLastSearchedCity(String cityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastCity', cityName);
  }

  void refreshWeather() {
    setState(() {
      weatherFuture = WeatherServices().fetchWeather(widget.cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Weather>(
        future: weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WeatherDetailsUi(
              weather: snapshot.data!,
              refreshWeather: refreshWeather,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
