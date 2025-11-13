import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import '../models/app_theme.dart';

class ThemeService {
  static const String _themeKey = 'selected_theme';
  static const String _brightnessKey = 'brightness_mode'; // 
  final Logger _logger = Logger();

  // Guardar tema seleccionado
  Future<void> saveTheme(AppThemeType themeType) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, themeType.toString());
      _logger.d('Tema guardado: ${themeType.toString()}');
    } catch (e) {
      _logger.e('Error al guardar tema: $e');
    }
  }

  // Cargar tema guardado
  Future<AppThemeType> loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? savedTheme = prefs.getString(_themeKey);
      
      if (savedTheme != null) {
        final theme = AppTheme.fromString(savedTheme);
        _logger.d('Tema cargado: ${theme.toString()}');
        return theme;
      }
    } catch (e) {
      _logger.e('Error al cargar tema: $e');
    }
    
    // Retornar tema por defecto si no hay guardado
    _logger.d('Usando tema por defecto: Gon');
    return AppThemeType.gon;
  }

  //  Guardar modo de brillo (claro/oscuro)
  Future<void> saveBrightnessMode(ThemeBrightnessMode mode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_brightnessKey, mode.toString());
      _logger.d('Modo de brillo guardado: ${mode.toString()}');
    } catch (e) {
      _logger.e('Error al guardar modo de brillo: $e');
    }
  }

  //  Cargar modo de brillo
  Future<ThemeBrightnessMode> loadBrightnessMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? savedMode = prefs.getString(_brightnessKey);
      
      if (savedMode != null) {
        final mode = AppTheme.brightnessModeFromString(savedMode);
        _logger.d('Modo de brillo cargado: ${mode.toString()}');
        return mode;
      }
    } catch (e) {
      _logger.e('Error al cargar modo de brillo: $e');
    }
    
    _logger.d('Usando modo por defecto: Light');
    return ThemeBrightnessMode.light;
  }

  // Limpiar preferencias (opcional, para debugging)
  Future<void> clearTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);
    await prefs.remove(_brightnessKey); // 
    _logger.d('Preferencias de tema limpiadas');
  }
}