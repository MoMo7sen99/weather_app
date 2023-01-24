import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/search_page.dart';
import 'package:weatherapp/services/get_location.dart';


import '../models/weather_model.dart';
import '../services/service.dart';
import '../shared/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  HomePage({Key? key}) : super(key: key);

  late Position cl ;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return SearchPage();
                })));
                // showSearch(context: context, delegate: DataSearch());
              },
            ),
            IconButton(
                onPressed: ()async {
                 cl = (await determinePosition())!;
                 WeatherService service = WeatherService();
               //  print("xx${cl.latitude},${cl.longitude}xx");
                  WeatherModel? weather = await service.getWeather(cityName: "${cl.latitude},${cl.longitude}");
                  Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
                },
                icon: const Icon(Icons.my_location))
          ],
        ),
        body: weatherData == null
            ?  const Center(
                child:
                    Text(
                      textAlign: TextAlign.center,
                      "There is no Weather data,                       start Searching now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                )

            : Container(
                //color: const Color(0xff184836),
                decoration:const  BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff184836),
                    Color(0xff317256),
                    Color(0xff398564),
                    Color(0xff419873),
                    Color(0xff49ab81),
                    Color(0xff52bf90),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Text(
                      weatherData?.cityName ?? "",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      " Last Update :    ${weatherData!.date} ",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: NetworkImage("https:${weatherData?.image}"),
                        ),
                        //Image.asset('assets/weather/64x64/${weatherData?.img}',),
                        Text(
                          weatherData?.temp?.toInt().toString() ?? "",
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "Max Temp : ${weatherData?.maxTemp?.toInt()} ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Min Temp : ${weatherData?.minTemp?.toInt()} ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Text(
                      weatherData?.weatherStateName ?? "",
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(
                      flex: 25,
                    ),
                  ],
                ),
              ));
  }
}
