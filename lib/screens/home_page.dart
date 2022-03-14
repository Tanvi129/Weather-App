import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/bloc/internet_cubit.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/services/WeatherApi.dart';

import 'connection_error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    print("this is an init state");
    // WeatherApi weather =  WeatherApi(location: "Dehradun");
    // final weatherCity =  weather.getdata();
    // print(weatherCity.city);
  }

  
  //final weatherCity =  weather.getdata();

  @override
  void dispose() {
    // TODO: implement dispose
    print("This is an Dispose state");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: SafeArea(
          child: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              WeatherApi weather = WeatherApi(location: "Mumbai");
              if(state is InternetDisconnected){
               return const ConnectionErrorPage();
              }
              return Column(
                
                children: <Widget>[
                  FutureBuilder(
                      future: weather.getdata(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.none) {
                          return const AlertDialog(
                            title: Text("Failed to load Data"),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                            final Weather weatherData =
                                snapshot.data as Weather;
                            return Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${weatherData.city}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${weatherData.temp_min}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${weatherData.temp_max}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${weatherData.humidity}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${weatherData.pressure}',
                                    style: const TextStyle(fontSize: 18),
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
              );
            },
          ),
        ));
  }
}
