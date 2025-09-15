import 'package:flutter/material.dart';
import '../models/verse.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Verse> _favorites = [];

  List<Verse> get favorites => _favorites;

  void addFavorite(Verse verse) {
    _favorites.add(verse);
    notifyListeners();
  }

  void removeFavorite(Verse verse) {
    _favorites.remove(verse);
    notifyListeners();
  }

  bool isFavorite(Verse verse) {
    return _favorites.contains(verse);
  }
}
