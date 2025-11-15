enum AppThemeType {
  gon,
  killua,
  // Aquí puedes agregar más temas en el futuro: hisoka, kurapika, etc.
}

//  Enum para el modo de brillo
enum ThemeBrightnessMode {
  light,
  dark,
}

class AppTheme {
  final AppThemeType type;
  final String displayName;
  final String description;

  const AppTheme({
    required this.type,
    required this.displayName,
    required this.description,
  });

  // Lista de todos los temas disponibles (esto es para "escalar")
  static const List<AppTheme> availableThemes = [
    AppTheme(
      type: AppThemeType.gon,
      displayName: 'Tema Gon',
      description: 'Inspirado en Gon Freecss',
    ),
    AppTheme(
      type: AppThemeType.killua,
      displayName: 'Tema Killua',
      description: 'Inspirado en Killua Zoldyck',
    ),
    //aqui se agregan mas temas 
    
  ];

  // Convertir de String a enum (para SharedPreferences)
  static AppThemeType fromString(String value) {
    return AppThemeType.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => AppThemeType.gon, // Tema por defecto
    );
  }

  //  Convertir brightness mode de String
  static ThemeBrightnessMode brightnessModeFromString(String value) {
    return ThemeBrightnessMode.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => ThemeBrightnessMode.light, // Modo por defecto
    );
  }
}