import 'dart:convert';
import 'package:bouhcine/pages/tempDescription.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final String apiKey = '51afae922e54469b1a04cc51734bffe4';
  var weatherData;
  var controller = TextEditingController();

  void _fetchData(String city) async {
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(apiUrl));
    weatherData = json.decode(response.body);

    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => tempDescription(
          temp: weatherData['main']['temp'],
          temp_min: weatherData['main']['temp_min'],
          temp_max: weatherData['main']['temp_max'],
          pressure: weatherData['main']['pressure'],
          humidity: weatherData['main']['humidity'],
          country: weatherData['sys']['country'],
          temperature: weatherData['main']['temp'],
          iconCode: weatherData['weather'][0]['icon'],
          descreption: weatherData['weather'][0]['description'],
          cityname: weatherData['name'],
        ),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Weather Application"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
            labelText: 'City',
            hintText: 'Enter a search term',
            ),
          ),
          TextButton(onPressed: () {
            _fetchData(controller.text);
          },
            child: Text('Search'),
          ),
        ],
      ),
      ),
    );
  }
}