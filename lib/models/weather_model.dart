

class Weather{
  final String? city,mainWeather;
  final double? temp_min,temp_max;
  final int? humidity;
  final int? pressure,visibility;
  Weather({ this.mainWeather,this.pressure, this.temp_max, this.temp_min , this.visibility, this.humidity , this.city});

  factory Weather.fromJson(Map<String, dynamic> data) {
    final mainWeather = data["weather"][0]["main"];
    final temp_min=data["main"]["temp_min"];
    final temp_max=data["main"]["temp_max"];
    final pressure=data["main"]["pressure"];
    final humidity=data["main"]["humidity"];
    final visibility=data["visibility"];
    final city=data["name"];

    return Weather(mainWeather: mainWeather, pressure:  pressure, temp_max:  temp_max, temp_min: temp_min, visibility: visibility , humidity: humidity , city: city);

  }


}