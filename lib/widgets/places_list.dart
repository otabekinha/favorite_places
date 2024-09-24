import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No Places added yet'),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => Card(
        margin: const EdgeInsets.only(
          top: 10,
          left: 12,
          right: 12,
          bottom: 0,
        ),
        child: ListTile(
          leading: const Icon(
            Icons.location_on_outlined,
            color: Colors.deepPurple,
          ),
          title: Text(places[index].title),
          trailing: const Icon(
            Icons.arrow_forward,
            color: Colors.deepPurple,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlaceDetailScreen(
                  place: places[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
