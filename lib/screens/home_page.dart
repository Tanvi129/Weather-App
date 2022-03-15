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
    final _formKey = GlobalKey<FormState>();
    final myController = TextEditingController();
    String? city;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: SafeArea(
          child: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetDisconnected) {
                return const ConnectionErrorPage();
              }

              return Container(
                padding: EdgeInsets.all(24),
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Enter the City Name:",
                          style: TextStyle(
                            fontSize: 24,
                          )),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter a City Name";
                                }
                                return null;
                              },
                              controller: myController,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                city=myController.text;
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, "/weatherDisplay",
                                      arguments: city);
                                }
                              },
                              child: const Text(
                                "Get Weather",
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      const Size(150, 50)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            },
          ),
        ));
  }
}
