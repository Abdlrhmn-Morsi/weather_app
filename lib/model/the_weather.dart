class TheWeather {
  String? name;
  String? countryName;
  List<Cloud>? cloud;
  WeatherInfo? weatherInfo;
  double? windSpeed;
  TheWeather({
    this.name,
    this.countryName,
    this.cloud,
    this.weatherInfo,
    this.windSpeed,
  });

  TheWeather.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    countryName = map['sys']['country'];
    cloud = (map['weather'] as List).map((c) => Cloud.fromMap(c)).toList();
    weatherInfo = WeatherInfo.fromMap(map['main']);
    windSpeed = map['wind']['speed'];
  }
}

class Cloud {
  String? name, description;
  Cloud({
    this.name,
    this.description,
  });

  Cloud.fromMap(Map<String, dynamic> map) {
    name = map['main'];
    description = map['description'];
  }
}

class WeatherInfo {
  double? temp, tempMin, tempMax;
  WeatherInfo({this.tempMin, this.tempMax, this.temp});

  WeatherInfo.fromMap(Map<String, dynamic> map) {
    temp = map['temp'];
    tempMin = map['temp_min'];
    tempMax = map['temp_max'];
  }
}
