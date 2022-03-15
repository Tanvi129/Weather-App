import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/screens/connection_error_page.dart';
import 'package:my_weather_app/screens/home_page.dart';
import 'package:my_weather_app/screens/result_page.dart';

import 'bloc/internet_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Connectivity connectivity = Connectivity();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(connectivity: connectivity),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        
        routes: {
          '/': (context) => const HomePage(),
          '/connectionError' : (context) => const ConnectionErrorPage(),
          "/home" : (context) => const HomePage(),
          "/weatherDisplay": (context) => const ResultPage(),
        },
      ),
    );
  }
}
