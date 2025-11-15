import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/favoritos_service.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesService _favoritesService = FavoritesService();
  final Logger _logger = Logger();
  
  List<String> _favorites = [];
  bool _isLoading = true;

  List<String> get favorites => _favorites;
  bool get isLoading => _isLoading;
  int get favoritesCount => _favorites.length;

  Future<void> initialize() async {
    _logger.d('Inicializando FavoritesProvider...');
    _favorites = await _favoritesService.loadFavorites();
    _isLoading = false;
    notifyListeners();
    _logger.d('FavoritesProvider inicializado con ${_favorites.length} favoritos');
  }

  bool isFavorite(String itemId) {
    return _favorites.contains(itemId);
  }

  Future<void> toggleFavorite(String itemId) async {
    if (_favorites.contains(itemId)) {
      _favorites.remove(itemId);
      _logger.d('Removido de favoritos: $itemId');
    } else {
      _favorites.add(itemId);
      _logger.d('Agregado a favoritos: $itemId');
    }
    
    await _favoritesService.saveFavorites(_favorites);
    notifyListeners();
  }

  Future<void> clearAllFavorites() async {
    _favorites.clear();
    await _favoritesService.saveFavorites(_favorites);
    notifyListeners();
    _logger.d('Todos los favoritos han sido limpiados');
  }
}