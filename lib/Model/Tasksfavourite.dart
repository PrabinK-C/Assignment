// ignore_for_file: file_names

import 'package:assignment/Model/task.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasksfav {
  final int id;
  final String title;
  final String body;
  bool isFavourite;
  Tasksfav({
    required this.id,
    required this.title,
    required this.body,
    required this.isFavourite,
  });
  void togglefavourite() {
    isFavourite = !isFavourite;
  }
}

class Favoriteprovider with ChangeNotifier {
  List<String> _favoriteIds = [];

  List<String> get favoriteIds => _favoriteIds;
  List<Task> _allTasks = [];
  List<Task> get favoriteTasks {
    return _allTasks.where((task) => _favoriteIds.contains(task.id)).toList();
  }

  void setAllTasks(List<Task> tasks) {
    _allTasks = tasks;
    notifyListeners();
  }

  Favoriteprovider() {
    loadfavourites();
  }

  Future<void> loadfavourites() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds = prefs.getStringList('favorites') ?? [];
    notifyListeners();
  }

  Future<void> saveFavourite() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favoriteIds);
  }

  void addFavoriteById(String id) {
    if (!_favoriteIds.contains(id)) {
      _favoriteIds.add(id);
      saveFavourite();
      notifyListeners();
    }
  }

  void removeFavoriteById(String id) {
    _favoriteIds.remove(id);
    saveFavourite();
    notifyListeners();
  }

  bool isFavoriteById(String id) => _favoriteIds.contains(id);
}
