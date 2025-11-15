import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class FavoritesService {
  static const String _favoritesKey = 'user_favorites';
  final Logger _logger = Logger();

  // Guardar lista de favoritos
  Future<void> saveFavorites(List<String> favorites) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_favoritesKey, favorites);
      _logger.d('Favoritos guardados: $favorites');
    } catch (e) {
      _logger.e('Error al guardar favoritos: $e');
    }
  }

  // Cargar lista de favoritos
  Future<List<String>> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? savedFavorites = prefs.getStringList(_favoritesKey);
      
      if (savedFavorites != null) {
        _logger.d('Favoritos cargados: $savedFavorites');
        return savedFavorites;
      }
    } catch (e) {
      _logger.e('Error al cargar favoritos: $e');
    }
    
    _logger.d('No hay favoritos guardados, retornando lista vacía');
    return [];
  }

  // Limpiar favoritos (opcional, para debugging)
  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
    _logger.d('Favoritos limpiados');
  }
}