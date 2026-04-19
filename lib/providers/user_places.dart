import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';

import '../models/plan.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title, image: image, location: location);
    state = [newPlace, ...state];
  }
}

final userPlacesNotifier = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
    (ref) => UserPlacesNotifier(),
);