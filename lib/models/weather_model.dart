 class WeatherModel
{
    String? cityName;
    String? date;
    double? temp;
    double? maxTemp;
    double? minTemp ;
    String? weatherStateName;
    String? image;

   WeatherModel({
     required this.cityName,
     required this.date,
     required this.temp,
     required this.maxTemp,
     required this.minTemp,
     required this.weatherStateName,
     required this.image,
});

   WeatherModel.data(dynamic data )
   {

   cityName = data["location"]["name"];
   date= data["location"]["localtime"];
   temp= data["current"]["temp_c"];
   maxTemp= data["forecast"]["forecastday"][0]["day"]["maxtemp_c"] ;
   minTemp= data["forecast"]["forecastday"][0]["day"]["mintemp_c"] ;
   weatherStateName= data["current"]["condition"]["text"] ;
   image = data["current"]["condition"]["icon"] ;
   }


}

