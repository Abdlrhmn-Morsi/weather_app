import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/the_weather.dart';
import 'package:weather_app/network/weather_repo.dart';

class WeatherController extends GetxController {
  String? city;
  String? searchText;
  bool isLoaded = false;
  bool isError = false;
  TheWeather? myweather;
  List<TheWeather>myweatherList=[];
  bool isInit = false;
  final searchTextController = TextEditingController();

  updateWeather() {
    isLoaded = true;

    WeatherRepo(city: city ?? 'Aswan').getWeatherData(
      onSuccess: ((theWeather) => {
            myweather = theWeather,
            isLoaded = false,
            isError = false,
            update(),
          }),
      onError: (error) => {
        isLoaded = false,
        isError = true,
        update(),
      },
    );
    update();
  }

  updateWeatherList() {
    isLoaded = true;
    List<String> egycities = [
      'Aswan',
      'cairo',
      'Alexandria',
      'luxor',
      'Giza',
    ];
    egycities.forEach(
      ((c) => WeatherRepo(city: c).getWeatherData(
            onSuccess: ((theWeather) => {
                  myweatherList.add(theWeather),
                  isLoaded = false,
                  isError = false,
                  update(),
                }),
            onError: (error) => {
              isLoaded = false,
              isError = true,
              update(),
            },
          )),
    );

    update();
  }

  @override
  void onInit() {
    updateWeather();
    updateWeatherList();
    super.onInit();
  }
}
