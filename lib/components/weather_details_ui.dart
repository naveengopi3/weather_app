import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/weather_details_screen.dart';

class WeatherDetailsUi extends StatelessWidget {
  final Weather weather;
  final Function refreshWeather;

  const WeatherDetailsUi(
      {required this.weather, required this.refreshWeather, super.key});

  @override
  Widget build(BuildContext context) {
     String formattedDate = DateFormat.yMMMd().format(DateTime.now());
         String formattedTime = DateFormat.jm().format(DateTime.now()); // Format time as HH:mm

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFF1A2344),  
            Color.fromARGB(255, 125, 32, 142),
            Colors.purple,
            Color.fromARGB(255, 151, 44, 170),
          ])),
      child: Center(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      " ${weather.cityName}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 300,  
                      width: 280,
                      child: WeatherDetailsScreen.getWeatherIcon(
                          weather.weatherCondition),
                    ),
                    Text(
                      "${weather.temperature.current.toStringAsFixed(1)}°C",
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      weather.weatherCondition,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                     Text(formattedDate, 
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                            Text(
                          formattedTime,
                          style: const TextStyle( 
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black.withOpacity(0.3)),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/img/humidity.png",
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Humidity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${weather.humidity}%',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/img/wind.png",
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Wind",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${weather.windSpeed.toString()} km/h",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              indent: 2,
                              endIndent: 2,
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/img/temp max.png",
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Temp max",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${weather.tempMax.toStringAsFixed(1)}°C',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/img/temp min.png",
                                      scale: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Temp Min",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${weather.tempMin.toStringAsFixed(1)}°C",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => refreshWeather(),
                        child: const Text("Refresh"))
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
