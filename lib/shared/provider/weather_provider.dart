import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel? _weatherData ;

  set weatherData (WeatherModel? weather){
    _weatherData = weather;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherData ;
}