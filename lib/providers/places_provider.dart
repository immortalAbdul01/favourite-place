import 'package:fav_places/models/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesNotifer extends StateNotifier<List<Places>> {
  PlacesNotifer() : super([]);

  void addItem(Places place) {
    state = [...state, place];
  }
}

final placesProvider =
    StateNotifierProvider<PlacesNotifer, List<Places>>((ref) {
  return PlacesNotifer();
});
