import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/screens/home_page.dart';
import 'package:weatherapp/shared/provider/weather_provider.dart';

void main() {
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {


  WeatherApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      } ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.green,

        ),
      ),
    );
  }
}

