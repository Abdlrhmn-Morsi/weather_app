import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';

class Inject {
  WeatherController weatherController = Get.put(WeatherController());
}
