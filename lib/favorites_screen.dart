import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> favoriteCities;
  final Function(String) toggleFavorite;

  FavoritesScreen(this.favoriteCities, this.toggleFavorite);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleFavorite(String city) {
    widget.toggleFavorite(city);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorilerim' ,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.favoriteCities.isEmpty
            ? Center(child: Text('Favori şehir bulunmamaktadır.'))
            : ListView.builder(
          itemCount: widget.favoriteCities.length,
          itemBuilder: (context, index) {
            String city = widget.favoriteCities[index];
            return ListTile(
              title: Text(city),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  _toggleFavorite(city);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}