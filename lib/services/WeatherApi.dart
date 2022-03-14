import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:my_weather_app/models/weather_model.dart';
class WeatherApi{
  final String location;
  WeatherApi({required this.location});

  Future<Weather> getdata() async {
    
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9a8bb9f1336e5e75cd89cff2ff784ccf');

    var response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    Weather weatherCity = Weather.fromJson(data);
    return(weatherCity);

    

    
  }
}