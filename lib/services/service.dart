import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'package:provider/provider.dart';


import '../models/weather_model.dart';
import '../shared/provider/weather_provider.dart';

class WeatherService
{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '291e981b6d8f4969ac300822231201';


  Future <WeatherModel?> getWeather ({required String cityName}) async
  {
    WeatherModel? weather;

    try
    {
      Uri url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
    Response response = await get(url);
    Map<String,dynamic> data = jsonDecode(response.body);

    weather = WeatherModel.data(data);
    }
    catch (e){
      print (e);
    }
    return weather;
  }


}





class DataSearch extends SearchDelegate {

  String? cityName;
  List<String> city =
  [
    "Abidjan",
    "ACCRA",
    "Adana"	,
    "ADDIS-ABABA"	,
    "Adelaide"	,
    "Agra"	,
    "Ahmadabad"	,
    "Halab"	,
    "Alexandria"	,
    "ALGIERS"	,
    "Allahabad"	,
    "ALMATY"	,
    "AMMAN"	,
    "Amritsar"	,
    "ANKARA"	,
    "Anshan"	,
    "Aswan",
    "BAGHDAD"	,
    "Baku"	,
    "Bandung"	,
    "Bangalore"	,
    "BANGKOK"	,
    "Baotou"	,
    "Barcelona"	,
    "Barquisimeto"	,
    "Barranquilla"	,
    "Basrah"	,
    "BEIJING"	,
    "BEIRUT"	,
    "Belem"	,
    "BELGRADE"	,
    "Belo-Horizonte"	,
    "Benghazi"	,
    "Benin"	,
    "Berlin"	,
    "Bhopal"	,
    "Birmingham"	,
    "BOGOTA"	,
    "BRASILIA"	,
    "BRAZZAVILLE"	,
    "Brisbane"	,
    "BUCHAREST"	,
    "BUDAPEST"	,
    "Buenos-Aires"	,
    "Bursa"	,
    "Busan"	,
    "Cairo"	,
    "Cali"	,
    "Campinas"	,
    "Capetown"	,
    "CARACAS"	,
    "Casablanca"	,
    "Changchun"	,
    "Changsha"	,
    "Changzhou"	,
    "Chelyabinsk"	,
    "Chengdu"	,
    "Chennai"	,
    "Chicago"	,
    "Chittagong"	,
    "Chongquin"	,
    "Ciudad-Juarez"	,
    "CONAKRY"	,
    "COPENHAGEN"	,
    "Cordoba"	,
    "Curitiba"	,
    "Daegu"	,
    "Daejon"	,
    "DAKAR"	,
    "Dalian"	,
    "Dallas"	,
    "DAMASCUS"	,
    "DAR-ES-SALAAM"	,
    "Datong"	,
    "DELHI"	,
    "DHAKA"	,
    "Dnipropetrovsk"	,
    "Donetsk"	,
    "Douala"	,
    "Durban"	,
    "Ecatepec"	,
    "Ekaterinburg"	,
    "Faisalabad"	,
    "Fortaleza"	,
    "Foshan"	,
    "FREETOWN"	,
    "Fukuoka"	,
    "Fuzhou"	,
    "Giza"	,
    "Goiania"	,
    "Guadalajara"	,
    "Guangzhou"	,
    "Guarulhos"	,
    "GUATAMALA-CITY"	,
    "Guayaquil"	,
    "Guiyang"	,
    "Gujranwala"	,
    "Gwangju"	,
    "Haiphong"	,
    "Hamburg"	,
    "Handan"	,
    "Hangzhou"	,
    "HANOI"	,
    "Haora"	,
    "HARARE"	,
    "Harbin"	,
    "HAVANA"	,
    "Hefei"	,
    "Hiroshima"	,
    "Ho-Chi-Minh-City"	,
    "Hong-Kong"	,
    "Houston"	,
    "Hyderabad"	,
    "Ibadan"	,
    "Incheon"	,
    "Indore"	,
    "Irbil"	,
    "Isfahen"	,
    "Istanbul"	,
    "Izmir"	,
    "Jaipur"	,
    "JAKARTA"	,
    "Jeddah"	,
    "Jilin"	,
    "Jodphur"	,
    "Johannesburg"	,
    "KABUL"	,
    "Kaduna"	,
    "Kano"	,
    "Kanpur"	,
    "Kaohsiung"	,
    "Karachi"	,
    "Kawasaki"	,
    "Kazan"	,
    "Kharkiv"	,
    "KHARTOUM"	,
    "Khulna"	,
    "KIEV"	,
    "KINSHASA"	,
    "Kitakyushu"	,
    "Kobe"	,
    "Kolkata"	,
    "Kowloon"	,
    "KUALA-LUMPUR"	,
    "Kunming"	,
    "Kyoto"	,
    "LA-PAZ"	,
    "Lagos"	,
    "Lahore"	,
    "Lanzhou"	,
    "Leon"	,
    "LIMA"	,
    "LONDON"	,
    "Los-Angeles"	,
    "LUANDA"	,
    "Lubumbashi"	,
    "Lucknow"	,
    "Ludhiana"	,
    "Luoyang"	,
    "LUSAKA"	,
    "MADRID"	,
    "Maiduguri"	,
    "Makassar"	,
    "MANAGUA"	,
    "Manaus"	,
    "MANILA"	,
    "MAPUTO"	,
    "Maracaibo"	,
    "Mashhad"	,
    "Mecca"	,
    "Medan"	,
    "Medellin"	,
    "Medina"	,
    "Meerut"	,
    "Melbourne"	,
    "Mexicali"	,
    "MEXICO-CITY"	,
    "Milan"	,
    "MINSK"	,
    "MOGADISHU"	,
    "Monterrey"	,
    "MONTEVIDEO"	,
    "Montreal"	,
    "MOSCOW"	,
    "Mosul"	,
    "Multan"	,
    "Mumbai"	,
    "Munich"	,
    "Nagoya"	,
    "Nagpur"	,
    "NAIROBI"	,
    "Nanchang"	,
    "Nanjing"	,
    "Nanning"	,
    "Napoli"	,
    "Nashik"	,
    "New-York"	,
    "Nezahualcoyotl"	,
    "Nizhny Novgorod"	,
    "Novosibirsk"	,
    "Odessa"	,
    "Omdurman"	,
    "Omsk"	,
    "Osaka"	,
    "Palembang"	,
    "PARIS"	,
    "Patna"	,
    "Perm"	,
    "Perth"	,
    "Peshawar"	,
    "Philadelphia"	,
    "PHNOM-PENH"	,
    "Phoenix"	,
    "Pimpri-Chinchwad"	,
    "Port-Harcourt"	,
    "PORT-AU-PRINCE"	,
    "port-said",
    "Porto-Alegre"	,
    "PRAGUE"	,
    "Puebla"	,
    "Pune"	,
    "PYONGYANG"	,
    "Qingdao"	,
    "Qiqihar"	,
    "QUITO"	,
    "RABAT"	,
    "Rajkot"	,
    "Ranchi"	,
    "Rawalpindi"	,
    "Recife"	,
    "Rio de Janeiro"	,
    "RIYADH"	,
    "ROME"	,
    "Rosario"	,
    "Rostov-on-Don"	,
    "Salvador"	,
    "Samara"	,
    "San-Antonio"	,
    "San-Diego"	,
    "SANAA"	,
    "Santa-Cruz"	,
    "SANTIAGO"	,
    "SANTO-DOMINGO"	,
    "Sao-Paulo"	,
    "Sapporo"	,
    "Semarang"	,
    "Sendai"	,
    "Seongnam"	,
    "Seoul"	,
    "Shanghai"	,
    "Shenyang"	,
    "Shenzhen"	,
    "Shiraz"	,
    "Shiziahuang"	,
    "SINGAPORE"	,
    "SOFIA"	,
    "Soweto"	,
    "St-Petersburg"	,
    "STOCKHOLM"	,
    "Surabaya"	,
    "Surat"	,
    "Suzhou"	,
    "Sydney"	,
    "Tabriz"	,
    "Taichung"	,
    "TAIPEI"	,
    "Taiyuan"	,
    "Tangshan"	,
    "TASHKENT"	,
    "TBILISI"	,
    "Tegucigalpa"	,
    "TEHRAN"	,
    "Tianjin"	,
    "Tijuana"	,
    "TOKYO"	,
    "Toronto"	,
    "TRIPOLI"	,
    "PRETORIA"	,
    "TUNIS"	,
    "Ufa"	,
    "Ulsan"	,
    "Urumqi",
    "Vadodara"	,
    "Valencia"	,
    "Varanasi"	,
    "VIENNA"	,
    "Volgograd"	,
    "WARSAW"	,
    "Wuhan"	,
    "Wuxi"	,
    "Xian"	,
    "Xuzhou"	,
    "Yangon"	,
    "YAOUNDE"	,
    "Yerevan"	,
    "Yokohama"	,
    "Zapopan"	,
    "Zhengzhou"	,
    "Zibo"	,
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(
        onPressed: (){
          query = "";
        },
       icon: Icon(Icons.close),
    )
  ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> filter = city.where((element) => element.contains(query)).toList() ;

    return ListView.builder(
        itemCount: query =="" ? city.length  : filter.length ,
        itemBuilder: (context, i) => Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20 ),
            child: query == "" ? InkWell(
              onTap: ()async{query = "${city[i]}";
              cityName = query;
              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: query);
              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
              Navigator.pop(context);
                },
              child: Text("${city[i]}",
              style: const TextStyle(
                fontSize: 18,
              ),
              ),
            ) : InkWell(
              onTap: ()async{
                query = "${filter[i]}";
                 cityName = query;
                WeatherService service = WeatherService();
                WeatherModel? weather = await service.getWeather(cityName: query);
                Provider.of<WeatherProvider>(context,listen: false).weatherData = weather ;
                Navigator.pop(context);
              },
              child: Text("${filter[i]}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ),
        ),
    );
  }

}
