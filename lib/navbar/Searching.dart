import 'package:app01/data/Place.dart';
import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  const Searching({super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  final controller = TextEditingController();
  List<Place> places = allPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "ค้นหาสถานที่",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black)),
              ),
              onChanged: searchplace,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];

                return ListTile(
                  leading: Image.asset(
                    place.placeImage,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(place.place),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchplace(String query) {
    final suggestions = allPlace.where((place) {
      final placeName = place.place.toLowerCase();
      final input = query.toLowerCase();

      return placeName.contains(input);
    }).toList();
    setState(() {
      places = suggestions;
    });
  }
}
