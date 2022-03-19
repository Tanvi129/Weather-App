import 'package:flutter/material.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/services/WeatherApi.dart';
import 'package:my_weather_app/widgets/weather_item.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? city = ModalRoute.of(context)!.settings.arguments as String?;
    debugPrint(city);

    WeatherApi weather = WeatherApi(location: city ?? "");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Container(
        color: Colors.blue[50],
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: weather.getdata(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none) {
                        return const AlertDialog(
                          title: Text("Failed to load Data"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If we got an error
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error} occured',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                
                          // if we got our data
                        } else if (snapshot.hasData) {
                          // Extracting data from snapshot object
                          final Weather weatherData = snapshot.data as Weather;
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Image.asset( 'assets/images/weatherNoBackground.gif',
                                height: 200,
                                width: 200,
                                ),
                                SizedBox(
                                  height: 500,
                                  width: 400,
                                  child: ListView(
                                    
                                    
                                    children: [
                                      WeatherItem(title: "City : ",weatherParam: weatherData.city ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      WeatherItem(title: "Weather : ",weatherParam: weatherData.mainWeather),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                     
                                     
                                      WeatherItem(title: "Minimum Temperature : ",weatherParam: weatherData.temp_min),                            
                                      const SizedBox(
                                        height: 10,
                                      ),
                                     
                                      WeatherItem(title: "Maximum Temperature : ",weatherParam: weatherData.temp_max),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      
                                      WeatherItem(title: "Humitdity : ",weatherParam: weatherData.humidity ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      
                                      WeatherItem(title: "Pressure : ",weatherParam: weatherData.pressure),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      
                                      WeatherItem(title: "Visibility : ",weatherParam: weatherData.visibility),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                      return const Center(
                          child: AlertDialog(
                        title: Text("Failed to load Data"),
                      ));
                    }))
              ],
            ),
          )),
    );
  }
}
