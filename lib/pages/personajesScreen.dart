import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/personajeGon.dart';
/*import 'my_home_page.dart';
import 'lugaresScreen.dart';
import 'about.dart';
import 'package:google_fonts/google_fonts.dart';
*/
//import 'package:logger/logger.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes de HxH'),
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