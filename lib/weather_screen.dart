import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  final String cityName;

  WeatherScreen({required this.cityName});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Map<String, dynamic>? weatherData;
  List<Map<String, dynamic>>? forecastData;

  @override
  void initState() {
    super.initState();
    fetchWeather();
    fetchForecast();
  }

  Future<void> fetchWeather() async {
    final apiKey = 'f8a79e4a68fad1ccc71e5e1ee3c21d81';
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName}&appid=$apiKey&units=metric&lang=tr';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchForecast() async {
    final apiKey = 'f8a79e4a68fad1ccc71e5e1ee3c21d81';
    final url = 'https://api.openweathermap.org/data/2.5/forecast?q=${widget.cityName}&appid=$apiKey&units=metric&lang=tr';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['list'];
        final Map<String, List<dynamic>> dailyForecasts = {};

        for (var item in list) {
          final date = DateTime.parse(item['dt_txt']);
          final day = '${date.year}-${date.month}-${date.day}';

          if (!dailyForecasts.containsKey(day)) {
            dailyForecasts[day] = [];
          }

          dailyForecasts[day]?.add(item);
        }

        final List<Map<String, dynamic>> formattedForecast = dailyForecasts.entries.map((entry) {
          final dayForecasts = entry.value;
          final temp = dayForecasts[0]['main']['temp'];
          final description = dayForecasts[0]['weather'][0]['description'];
          final icon = dayForecasts[0]['weather'][0]['icon'];
          return {
            'day': entry.key,
            'temp': temp,
            'description': description,
            'icon': icon
          };
        }).toList();

        setState(() {
          forecastData = formattedForecast;
        });
      } else {
        throw Exception('Failed to load forecast data');
      }
    } catch (e) {
      print(e);
    }
  }

  IconData getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
      case '01n':
        return Icons.wb_sunny;
      case '02d':
      case '02n':
        return Icons.wb_cloudy;
      case '03d':
      case '03n':
        return Icons.cloud;
      case '04d':
      case '04n':
        return Icons.cloud_queue;
      case '09d':
      case '09n':
        return Icons.grain;
      case '10d':
      case '10n':
        return Icons.beach_access;
      case '11d':
      case '11n':
        return Icons.flash_on;
      case '13d':
      case '13n':
        return Icons.ac_unit;
      case '50d':
      case '50n':
        return Icons.foggy;
      default:
        return Icons.help_outline;
    }
  }

  Color getIconColor(String iconCode) {
    switch (iconCode) {
      case '01d':
      case '01n':
        return Colors.orange;
      case '02d':
      case '02n':
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        return Colors.blue;
      case '09d':
      case '09n':
      case '10d':
      case '10n':
        return Colors.lightBlue;
      case '11d':
      case '11n':
        return Colors.yellow;
      case '13d':
      case '13n':
        return Colors.lightBlueAccent;
      case '50d':
      case '50n':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Durumu - ${widget.cityName}', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: weatherData == null || forecastData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Icon(
                  getWeatherIcon(weatherData!['weather'][0]['icon']),
                  size: 100,
                  color: getIconColor(weatherData!['weather'][0]['icon']),
                ),
                SizedBox(height: 10),
                Text(
                  '${weatherData!['main']['temp']}°C',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherData!['weather'][0]['description'],
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.thermostat),
                      title: Text('Hissedilen Sıcaklık'),
                      trailing: Text('${weatherData!['main']['feels_like']}°C'),
                    ),
                    ListTile(
                      leading: Icon(Icons.water),
                      title: Text('Nem'),
                      trailing: Text('${weatherData!['main']['humidity']}%'),
                    ),
                    ListTile(
                      leading: Icon(Icons.compress),
                      title: Text('Basınç'),
                      trailing: Text('${weatherData!['main']['pressure']} hPa'),
                    ),
                    ListTile(
                      leading: Icon(Icons.air),
                      title: Text('Rüzgar Hızı'),
                      trailing: Text('${weatherData!['wind']['speed']} km/h'),
                    ),
                    ListTile(
                      leading: Icon(Icons.visibility),
                      title: Text('Görüş Mesafesi'),
                      trailing: Text('${weatherData!['visibility'] / 1000} km'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '5 Günlük Tahmin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: forecastData!.length,
                itemBuilder: (context, index) {
                  final dayForecast = forecastData![index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayForecast['day'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Icon(
                            getWeatherIcon(dayForecast['icon']),
                            size: 40,
                            color: getIconColor(dayForecast['icon']),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${dayForecast['temp']}°C',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            dayForecast['description'],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
