import 'package:fav_places/models/places.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Places place;
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('${place.name}  details'),
      ),
      body: Center(
        child: Text(
          place.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ));
  }
}