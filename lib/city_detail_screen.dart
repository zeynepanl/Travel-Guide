import 'package:flutter/material.dart';
import 'weather_screen.dart';

class CityDetailScreen extends StatelessWidget {
  final String cityName;
  final String cityImage;
  final String cityInfo;
  final List<String> placesToVisit;
  final List<String> placeImages;
  final List<String> popularRestaurants;
  final List<String> famousFoods;

  CityDetailScreen({
    required this.cityName,
    required this.cityImage,
    required this.cityInfo,
    required this.placesToVisit,
    required this.placeImages,
    required this.popularRestaurants,
    required this.famousFoods,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              cityImage,
              fit: BoxFit.cover,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              cityName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              cityInfo,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeatherScreen(cityName: cityName),
                      ),
                    );
                  },
                  icon: Icon(Icons.wb_sunny,color:Colors.purple),
                  label: Text('Hava Durumu',style: TextStyle(color: Colors.purple)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,

                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Haritada gösterme işlemi
                  },
                  icon: Icon(Icons.map,color:Colors.purple),
                  label: Text('Haritada Göster',style: TextStyle(color: Colors.purple)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Gezilecek Yerler',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: placesToVisit.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.asset(
                          placeImages[index],
                          fit: BoxFit.cover,
                          width: 150,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          placesToVisit[index],
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Popüler Restoranlar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            for (var restaurant in popularRestaurants)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(restaurant),
              ),
            SizedBox(height: 20),
            Text(
              'Ünlü Yemekler',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            for (var food in famousFoods)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(food),
              ),
          ],
        ),
      ),
    );
  }
}