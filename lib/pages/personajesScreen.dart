// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hatsuxhatsu/pages/personajeGon.dart';
import '../Funcions/app_drawer.dart';


//Pantalla de la lista de personajes de HxH
class PersonajesScreen extends StatelessWidget {
  const PersonajesScreen({super.key});

  //lista de imagenes de los personajes
  final List<String> pixelArt = const [
    "assets/Personajes/Gon-Head.png",
    "assets/Personajes/Killua-Head.png",
    "assets/Personajes/Leorio-Head.png",
  ];

  static const List<String> titles = [
    "Gon Freecss",
    "Killua Zoldyck",
    "Leorio Paradinight",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer, //  Fondo del scaffold
      appBar: AppBar(
        title: const Text('Personajes de HxH'),
        backgroundColor: colorScheme.primary, //  Color primario del tema
        foregroundColor: colorScheme.onPrimary, //  Color sobre primario

        // Dejar menu lateral, el Drawer ya lo agrega automáticamente
      ),

      drawer: buildAppDrawer(context, current: 'personajes'),
      // Ahora el contenido es una lista de Cards con imágenes
      body: ListView.builder(
        itemCount: pixelArt.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonajeGon()),
              );
            },
            child: Card(
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              height: 120,
              child: Image.asset(
                pixelArt[index],
                width: double.infinity,
              ),
            ),
          ),
          );

        },
      ),
    );
  }
}