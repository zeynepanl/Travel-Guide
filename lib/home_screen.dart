import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'favorites_screen.dart';
import 'notes_screen.dart';
import 'city_detail_screen.dart';
import 'city_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CityInfo> filteredCities = citiesInfo;
  TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;

  // Favori şehirleri tutmak için liste
  List<String> favoriteCities = [];

  void _filterCities(String query) {
    setState(() {
      filteredCities = citiesInfo.where((city) => city.cityName.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void _onSearchTap() {
    setState(() {
      isSearchActive = true;
    });
  }

  void _onSearchExit() {
    setState(() {
      isSearchActive = false;
      searchController.clear();
      filteredCities = citiesInfo;
    });
  }

  void _toggleFavorite(String city) {
    setState(() {
      if (favoriteCities.contains(city)) {
        favoriteCities.remove(city);
      } else {
        favoriteCities.add(city);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akıllı Gezi Rehberi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen(favoriteCities, _toggleFavorite)),
              ).then((value) {
                setState(() {});
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Menü',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.purple),
              title: Text(
                'Profil',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.purple),
              title: Text(
                'Favoriler',
                style: TextStyle(color: Colors.black), // Metin rengi siyah
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen(favoriteCities, _toggleFavorite)),
                ).then((value) {
                  setState(() {});
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.note, color: Colors.purple),
              title: Text(
                'Notlar',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotesScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.save, color: Colors.purple),
              title: Text(
                'Kayıtlar',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: isSearchActive ? SizedBox() : Image.asset(
                    'assets/homeimg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.6),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        labelText: 'Şehir Ara',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: isSearchActive
                            ? IconButton(
                          icon: Icon(Icons.close),
                          onPressed: _onSearchExit,
                        )
                            : null,
                      ),
                      onChanged: _filterCities,
                      onTap: _onSearchTap,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (!isSearchActive)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotesScreen()),
                      );
                    },
                    icon: Icon(Icons.note),
                    label: Text('Notlarım'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.map),
                    label: Text('Harita'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  CityInfo city = filteredCities[index];
                  bool isFavorite = favoriteCities.contains(city.cityName);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityDetailScreen(
                            cityName: city.cityName,
                            cityImage: city.cityImage,
                            cityInfo: city.cityInfo,
                            placesToVisit: city.placesToVisit,
                            placeImages: city.placeImages,
                            popularRestaurants: city.popularRestaurants,
                            famousFoods: city.famousFoods,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                                  child: Image.asset(
                                    city.cityImage,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    icon: Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: isFavorite ? Colors.red : Colors.white,
                                    ),
                                    onPressed: () {
                                      _toggleFavorite(city.cityName);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(city.cityName),
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
