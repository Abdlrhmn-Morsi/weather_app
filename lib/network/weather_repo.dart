// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/network/weather_service.dart';

import '../const/const.dart';
import '../model/the_weather.dart';

class WeatherRepo {
  String? city;
  WeatherRepo({
    this.city,
  });

   getWeatherData({
    Function(TheWeather theWeather)? onSuccess,
    Function(Object? error)? onError,
  }) {
    String url = 'q=$city&${ConstApp.id}';

    WeatherService.getWeatherData(
        onError: (error) => {
              if (onError != null)
                {
                  // ignore: avoid_print
                  print(error),
                  onError(error),
                }
            },
        url: url,
        onSucess: (data) {
          onSuccess!(TheWeather.fromJson(data));
        });
  }
}
