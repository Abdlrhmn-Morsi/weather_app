import 'package:dio/dio.dart';
import 'package:weather_app/const/const.dart';

class WeatherService {
  static Dio? dio;
  static initData() {
    dio = Dio(BaseOptions(baseUrl: ConstApp.baseUrl));
  }

  static getWeatherData({
    Function(Object? error)? onError,
    String? url,
    Function(dynamic data)? onSucess,}
  ) {
    dio!.get(url!).then((value) {
      onSucess!(value.data);
    }).onError((error, stackTrace) => onError!(error));
  }
}
