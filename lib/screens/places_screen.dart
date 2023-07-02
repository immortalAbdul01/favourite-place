import 'package:fav_places/providers/places_provider.dart';
import 'package:fav_places/screens/new_place.dart';
import 'package:fav_places/screens/places_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacessScreen extends ConsumerStatefulWidget {
  const PlacessScreen({super.key});

  @override
  ConsumerState<PlacessScreen> createState() {
    return _PlacessScreen();
  }
}

class _PlacessScreen extends ConsumerState<PlacessScreen> {
  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    Widget content = places.isEmpty
        ? Center(
            child: Text(
              'No places are here',
              style: Theme.of(context).textTheme.titleLarge!,
            ),
          )
        : ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                places[index].name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => PlaceDetailScreen(place: places[index])));
              },
            ),
          );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Places'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => NewPlace()));
                })
          ],
        ),
        body: content);
  }
}
