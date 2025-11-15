//ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hatsuxhatsu/Funcions/app_drawer.dart';
import 'package:hatsuxhatsu/providers/theme_provider.dart';
import 'package:hatsuxhatsu/models/app_theme.dart';
import 'package:logger/logger.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("SettingsScreen cargada");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración y Preferencias'),
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      drawer: buildAppDrawer(context, current: 'configuracion'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Título principal
          Text(
            'Configuración de Usuario',
            style: TextStyle(
              fontSize: 24, 
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Personaliza tu experiencia en Hatsu x Hatsu',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 32),

          //  Sección de Modo Claro/Oscuro
          Row(
            children: [
              Icon(
                Icons.brightness_6_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Apariencia',
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface,fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Cambia entre modo claro y oscuro',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),

          //  Toggle de Modo Claro/Oscuro
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              final isDark = themeProvider.isDarkMode;

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
                child: SwitchListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  secondary: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: Icon(
                      isDark ? Icons.dark_mode : Icons.light_mode,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  title: Text(
                    isDark ? 'Modo Oscuro' : 'Modo Claro',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      isDark 
                          ? 'Reduce el brillo de la pantalla' 
                          : 'Mayor visibilidad con fondos claros',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  value: isDark,
                  onChanged: (bool value) async {
                    logger.d('Toggle brightness: $value');
                    await themeProvider.toggleBrightness();
                    
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                value ? Icons.dark_mode : Icons.light_mode,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                value 
                                    ? 'Modo oscuro activado' 
                                    : 'Modo claro activado',
                              ),
                            ],
                          ),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 32),

          // Sección de Temas (código existente)
          Row(
            children: [
              Icon(
                Icons.palette_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Tema de la Aplicación',
                style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Elige tu tema favorito inspirado en Hunter x Hunter',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),

          // Selector de Temas (código existente - sin cambios)
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Column(
                children: AppTheme.availableThemes.map((theme) {
                  final isSelected = themeProvider.currentTheme == theme.type;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline.withValues(alpha:0.3),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        child: Icon(
                          isSelected ? Icons.check_circle : Icons.circle_outlined,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                          size: 28,
                        ),
                      ),
                      title: Text(
                        theme.displayName,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          theme.description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      trailing: isSelected
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Activo',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Icon(
                              Icons.chevron_right,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      onTap: () async {
                        if (!isSelected) {
                          logger.d('Cambiando a ${theme.displayName}');
                          await themeProvider.setTheme(theme.type);

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    const Icon(Icons.check, color: Colors.white),
                                    const SizedBox(width: 12),
                                    Text('Tema cambiado a ${theme.displayName}'),
                                  ],
                                ),
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),

          // Otras configuraciones (código existente - sin cambios)
          Row(
            children: [
              Icon(
                Icons.settings_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Otras Preferencias',
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: const Text('Notificaciones'),
              subtitle: const Text('Configura tus alertas y avisos'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                logger.d('Navegando a Notificaciones');
                /*ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Configuración de notificaciones'),
                    duration: Duration(seconds: 2),
                  ),
                );
                */
              },
            ),
          ),
          const SizedBox(height: 8),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.volume_up_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              title: const Text('Sonidos'),
              subtitle: const Text('Ajusta el audio de la aplicación'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                logger.d('Navegando a Sonidos');
                /*
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Próximamente: Configuración de sonidos'),
                    duration: Duration(seconds: 2),
                  ),
                );
                */
              },
            ),
          ),

          const SizedBox(height: 32),

          // Info del tema actual
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  
                  color: Theme.of(context).colorScheme.surfaceContainer.withValues(alpha:0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withValues(alpha:0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tema actual: ${themeProvider.currentThemeName}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
