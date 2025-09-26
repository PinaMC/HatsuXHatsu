import 'package:flutter/material.dart';
import '../pages/my_home_page.dart';
import '../pages/lugaresScreen.dart';
import '../pages/personajesScreen.dart';
import '../pages/about.dart';
import 'package:google_fonts/google_fonts.dart';

// Drawer reutilizable para todas las pantallas
Drawer buildAppDrawer(BuildContext context, {required String current}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Text(
            'Menú',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        // Home
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          selected: current == 'home',
          onTap: () {
            if (current != 'home') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Hatsu x Hatsu')),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),

        // Lugares de HxH
        ListTile(
          leading: const Icon(Icons.landscape),
          title: const Text('Lugares de HxH'),
          selected: current == 'lugares',
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
          leading: const Icon(Icons.people_sharp),
          title: const Text('Personajes de HxH'),
          selected: current == 'personajes',
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

        // Acerca de
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Acerca de'),
          selected: current == 'about',
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