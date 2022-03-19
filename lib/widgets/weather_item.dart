import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({ Key? key , this.title , this.weatherParam}) : super(key: key);

  final String? title;
  final  weatherParam;

  @override
  Widget build(BuildContext context) {
    return  Container(
                                
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(color: Colors.blue[800]!,
                                ),
                                ),
                                padding:  const EdgeInsets.all(24),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.spaceEvenly,
                                  //crossAxisAlignment: CrossAxisAlignment.,
                                  
                                  children: [
                                    Text(
                                      title?? "Not Found",
                                      style:const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                      '${weatherParam?? "Not Found"}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              );
  }
}