import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/the_weather.dart';


// ignore: must_be_immutable
class WeatherCard extends StatelessWidget {
  TheWeather myweather;
  WeatherCard({
    Key? key,
    required this.myweather,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            myweather.name.toString(),
            style:const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
         const SizedBox(height: 5),
          Text(
            '${(myweather.weatherInfo!.temp! - 273.15).round().toString()}\u2103',
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(
            height: 45,
            child: LottieBuilder.asset(
              'assets/images/suncloud.json',
            ),
          ),
          Text(
            'wind ${myweather.windSpeed} m/s',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
