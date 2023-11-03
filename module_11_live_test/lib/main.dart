import 'dart:convert';
import 'package:flutter/material.dart';

class Weather {
  String city;
  int temperature;
  String condition;
  int humidity;
  double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      temperature: json['temperature'],
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'],
    );
  }
}

void main() {
  // Parse the JSON string
  const json = '[{"city": "New York", "temperature": 20, "condition": "Clear", "humidity": 60, "windSpeed": 5.5}, {"city": "Los Angeles", "temperature": 25, "condition": "Sunny", "humidity": 50, "windSpeed": 6.8}, {"city": "London", "temperature": 15, "condition": "Partly Cloudy", "humidity": 70, "windSpeed": 4.2}, {"city": "Tokyo", "temperature": 28, "condition": "Rainy", "humidity": 75, "windSpeed": 8.0}, {"city": "Sydney", "temperature": 22, "condition": "Cloudy", "humidity": 55, "windSpeed": 7.3}]';
  final decodedJson = jsonDecode(json) as List<dynamic>;

  // Create a list of Weather objects
  final weathers = decodedJson.map((e) => Weather.fromJson(e)).toList();

  runApp(MyApp(weathers: weathers));
}

class MyApp extends StatelessWidget {
  final List<Weather> weathers;

  const MyApp({Key? key, required this.weathers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: ListView.separated(
          itemCount: weathers.length,
          itemBuilder: (context, index) {
            final weather = weathers[index];

            return ListTile(
              title: Text('City: ${weather.city}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text('Condition: ${weather.condition}'),
                  Text('Humidity: ${weather.humidity}%'),
                  Text('Wind Speed: ${weather.windSpeed} m/s'),
                ],
              ),
            );
          }, separatorBuilder: ( context, index) {
            return const Divider();
        },
        ),
      ),
    );
  }
}

