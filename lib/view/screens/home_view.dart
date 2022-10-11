import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/model/the_weather.dart';
import 'package:weather_app/view/widgets/weather_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  WeatherController weatherController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/egypt3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: GetBuilder<WeatherController>(
            builder: (controller) => controller.myweather == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown.shade200,
                    ),
                  )
                : Stack(
                    children: [
                      controller.isLoaded
                          ? Positioned(
                              top: 90,
                              right: 80,
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator(
                                  color: Colors.brown.shade200,
                                ),
                              ))
                          : controller.isError
                              ? const Positioned(
                                  top: 105,
                                  right: 65,
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Text(
                                        'NOT FOUND',
                                        style: TextStyle(shadows: [
                                          Shadow(color: Colors.black),
                                          Shadow(color: Colors.black)
                                        ], color: Colors.amber, fontSize: 25),
                                      )))
                              : Container(),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Text(
                          controller.myweather!.name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        left: 20,
                        child: Text(
                          DateFormat('EEEE MMM d').format(DateTime.now()),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Positioned(
                        top: 180,
                        left: 20,
                        child: Text(
                          '${(controller.myweather!.weatherInfo!.temp! - 273.15).round().toString()}\u2103',
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 250,
                        left: 20,
                        right: 20,
                        child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: Get.width,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.brown.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: controller.searchTextController,
                            autofocus: false,
                            cursorColor: Colors.black,
                            onSubmitted: (v) {
                              controller.city = v;
                              controller.searchTextController.clear();
                              controller.updateWeather();
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Colors.brown.shade900,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 20,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                              child: LottieBuilder.asset(
                                'assets/images/weather-windy.json',
                              ),
                            ),
                            Text(
                              'wind ${controller.myweather!.windSpeed} m/s',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 5,
                        child: SizedBox(
                          width: Get.width,
                          height: 150,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, i) {
                                TheWeather myweather =
                                    controller.myweatherList[i];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: WeatherCard(myweather: myweather),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }
}
