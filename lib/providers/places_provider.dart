import 'package:fav_places/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class PlacesNotifer extends StateNotifier<List<Places>> {
  PlacesNotifer() : super([]);

  void addPlace(String title, File image) {
    final newPlace = Places(name: title, image: image);
    state = [newPlace, ...state];
  }
}

final placesProvider =
    StateNotifierProvider<PlacesNotifer, List<Places>>((ref) {
  return PlacesNotifer();
});
