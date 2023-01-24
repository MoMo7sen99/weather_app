import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../services/service.dart';
import '../shared/provider/weather_provider.dart';

class SearchPage extends StatelessWidget {
    SearchPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    String cityName ;


    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 30),
              border: OutlineInputBorder(),
              hintText: "enter a city name",
              labelText: "City",
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value){},
            onSubmitted: (data)async{
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: data);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
              Navigator.pop(context);
            },
          ),
        ),
      ),
    )
  ;}
}
