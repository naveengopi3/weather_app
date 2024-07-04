class Weather {
  final String cityName;
  final Temperature temperature;
  final String weatherCondition;
  final int humidity;
  final double windSpeed;

  final double tempMin;
  final double tempMax;

  Weather(
      {required this.cityName,
      required this.temperature,
      required this.weatherCondition,
      required this.humidity,
      required this.windSpeed,
      required this.tempMin,
      required this.tempMax});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: Temperature.fromJson(json['main']['temp']),
      weatherCondition: json['weather'][0]
          ['main'], // Accessing the first item in 'weather' array
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      tempMin: (json['main']['temp_min'] - 273.15),
      tempMax: (json['main']['temp_max'] - 273.15),
    );
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json) {
    return Temperature(
      current: (json - 273.15), // Kelvin to Celsius
    );
  }
}
