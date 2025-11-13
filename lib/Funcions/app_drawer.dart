import 'package:flutter/material.dart';
import '../pages/my_home_page.dart';
import '../pages/lugaresScreen.dart';
import '../pages/personajesScreen.dart';
import '../pages/about.dart';
import '../pages/configuracionUser.dart';
import 'package:google_fonts/google_fonts.dart';

// Drawer reutilizable para todas las pantallas
Drawer buildAppDrawer(BuildContext context, {required String current}) {
  // Obtener el tema actual
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return Drawer(
    backgroundColor: colorScheme.surface, //  Fondo del drawer
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: colorScheme.primary, //  Color primario del tema
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.primaryContainer,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.menu_book,
                size: 48,
                color: colorScheme.onPrimary, //  Color sobre primario
              ),
              const SizedBox(height: 8),
              Text(
                'Hatsu x Hatsu',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: colorScheme.onPrimary, //  Color sobre primario
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Wiki de Hunter x Hunter',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: colorScheme.onPrimary.withValues(alpha:0.8),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Home
        ListTile(
          leading: Icon(
            Icons.home,
            color: current == 'home' ? colorScheme.primary : colorScheme.onSurfaceVariant,
          ),
          title: Text(
            'Inicio',
            style: TextStyle(
              color: current == 'home' ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: current == 'home' ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: current == 'home',
          selectedTileColor: colorScheme.primaryContainer.withValues(alpha:0.3), //  Fondo cuando está seleccionado
          onTap: () {
            if (current != 'home') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Hatsu x Hatsu')),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

        // Lugares de HxH
        ListTile(
          leading: Icon(
            Icons.landscape,
            color: current == 'lugares' ? colorScheme.primary : colorScheme.onSurfaceVariant,
          ),
          title: Text(
            'Lugares de HxH',
            style: TextStyle(
              color: current == 'lugares' ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: current == 'lugares' ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: current == 'lugares',
          selectedTileColor: colorScheme.primaryContainer.withValues(alpha:0.3),
          onTap: () {
            if (current != 'lugares') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LugaresScreen()),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

        // Personajes de HxH
        ListTile(
          leading: Icon(
            Icons.people_sharp,
            color: current == 'personajes' ? colorScheme.primary : colorScheme.onSurfaceVariant,
          ),
          title: Text(
            'Personajes de HxH',
            style: TextStyle(
              color: current == 'personajes' ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: current == 'personajes' ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: current == 'personajes',
          selectedTileColor: colorScheme.primaryContainer.withValues(alpha:0.3),
          onTap: () {
            if (current != 'personajes') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PersonajesScreen()),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

        const Divider(), //  Separador visual

        // Pantalla de configuraciones
        ListTile(
          leading: Icon(
            Icons.settings,
            color: current == 'configuracion' ? colorScheme.primary : colorScheme.onSurfaceVariant,
          ),
          title: Text(
            'Configuraciones',
            style: TextStyle(
              color: current == 'configuracion' ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: current == 'configuracion' ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: current == 'configuracion',
          selectedTileColor: colorScheme.primaryContainer.withValues(alpha:0.3),
          onTap: () {
            if (current != 'configuracion') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

        // Acerca de
        ListTile(
          leading: Icon(
            Icons.info,
            color: current == 'about' ? colorScheme.primary : colorScheme.onSurfaceVariant,
          ),
          title: Text(
            'Acerca de',
            style: TextStyle(
              color: current == 'about' ? colorScheme.primary : colorScheme.onSurface,
              fontWeight: current == 'about' ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: current == 'about',
          selectedTileColor: colorScheme.primaryContainer.withValues(alpha:0.3),
          onTap: () {
            if (current != 'about') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    ),
  );
}