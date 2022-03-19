import 'dart:convert';
import 'dart:io'; 
import 'package:http/http.dart' as http;
import 'package:my_weather_app/models/weather_model.dart';
class WeatherApi{
  final String location;
  WeatherApi({required this.location});

  Future<Weather> getdata() async {

    try{
       final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9a8bb9f1336e5e75cd89cff2ff784ccf&units=metric');

    var response = await http.get(url);
    switch(response.statusCode){
      case 400:
      throw Failure("Unable to find City Name!!! 😢");
     

      case 404:
      throw Failure("Unable to find City Name!!! 😢");
      
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    Weather weatherCity = Weather.fromJson(data);
    return(weatherCity);



    }
    on SocketException {
      throw Failure("Oh no internet!!! 😢");
    }on HttpException{
      throw Failure("Something Went Wrong!!!😢");
    }catch(e){
      throw Failure(e.toString());
    }
         
  }

 
}

 class Failure{
    final String message;
    Failure( this.message);
    @override
  String toString() => message;
  }