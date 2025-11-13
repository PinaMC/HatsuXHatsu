import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../models/app_theme.dart';
import '../services/theme_service.dart';
import '../themes/theme_gon/theme_wrapper.dart' as theme_gon;
import '../themes/theme_killua/theme_wrapper.dart' as theme_killua;

class ThemeProvider extends ChangeNotifier {
  final ThemeService _themeService = ThemeService();
  final Logger _logger = Logger();
  
  AppThemeType _currentTheme = AppThemeType.gon;
  ThemeBrightnessMode _brightnessMode = ThemeBrightnessMode.light; // 
  bool _isLoading = true;

  AppThemeType get currentTheme => _currentTheme;
  ThemeBrightnessMode get brightnessMode => _brightnessMode; // 
  bool get isLoading => _isLoading;
  bool get isDarkMode => _brightnessMode == ThemeBrightnessMode.dark; // 

  // Obtener el ThemeData según el tema actual y el modo (claro/oscuro)
  ThemeData get themeData {
    switch (_currentTheme) {
      case AppThemeType.gon:
        return _brightnessMode == ThemeBrightnessMode.dark 
            ? theme_gon.getDarkTheme() 
            : theme_gon.getLightTheme();
      case AppThemeType.killua:
        return _brightnessMode == ThemeBrightnessMode.dark 
            ? theme_killua.getDarkTheme() 
            : theme_killua.getLightTheme();
      
    }
  }

  // Obtener nombre legible del tema actual
  String get currentThemeName {
    final theme = AppTheme.availableThemes.firstWhere(
      (t) => t.type == _currentTheme,
      orElse: () => AppTheme.availableThemes.first,
    );
    final modeText = _brightnessMode == ThemeBrightnessMode.dark ? ' (Oscuro)' : ' (Claro)';
    return theme.displayName + modeText;
  }

  // Inicializar y cargar tema y modo guardados
  Future<void> initialize() async {
    _logger.d('Inicializando ThemeProvider...');
    _currentTheme = await _themeService.loadTheme();
    _brightnessMode = await _themeService.loadBrightnessMode(); // 
    _isLoading = false;
    notifyListeners();
    _logger.d('ThemeProvider inicializado con tema: $_currentTheme, modo: $_brightnessMode');
  }

  // Cambiar tema y guardar
  Future<void> setTheme(AppThemeType newTheme) async {
    if (_currentTheme != newTheme) {
      _logger.d('Cambiando tema de $_currentTheme a $newTheme');
      _currentTheme = newTheme;
      await _themeService.saveTheme(newTheme);
      notifyListeners();
      _logger.d('Tema cambiado exitosamente');
    }
  }

  //  Cambiar modo claro/oscuro
  Future<void> setBrightnessMode(ThemeBrightnessMode newMode) async {
    if (_brightnessMode != newMode) {
      _logger.d('Cambiando modo de $_brightnessMode a $newMode');
      _brightnessMode = newMode;
      await _themeService.saveBrightnessMode(newMode);
      notifyListeners();
      _logger.d('Modo de brillo cambiado exitosamente');
    }
  }

  //  Toggle rápido entre claro y oscuro
  Future<void> toggleBrightness() async {
    final newMode = _brightnessMode == ThemeBrightnessMode.light 
        ? ThemeBrightnessMode.dark 
        : ThemeBrightnessMode.light;
    await setBrightnessMode(newMode);
  }

  // Método para ciclar entre temas (útil para testing)
  Future<void> toggleTheme() async {
    final allThemes = AppThemeType.values;
    final currentIndex = allThemes.indexOf(_currentTheme);
    final nextIndex = (currentIndex + 1) % allThemes.length;
    await setTheme(allThemes[nextIndex]);
  }
}