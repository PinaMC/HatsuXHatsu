import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'list_art.dart';
import 'about.dart';
import 'package:google_fonts/google_fonts.dart';

//Pantalla de la lista de personajes de HxH
class ListCreationScreen extends StatelessWidget {
  const ListCreationScreen({super.key});

  final List<String> pixelArt = const [
    "assets/Pixel-Art-Pizza-2.webp",
    "assets/Pixel-Art-Hot-Pepper-2-1.webp",
    "assets/Pixel-Art-Watermelon-3.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Creaciones'),
        // Dejar menu lateral, el Drawer ya lo agrega automáticamente
      ),
      drawer: Drawer( //empieza menu lateral
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
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
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: '2022479045')),
                  //lleva al menu inicial
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.landscape),
              title: const Text('Lista lugares de HxH'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ListArtScreen()), 
                  //lleva a la pantalla de la lista de lugares de HxH
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_sharp),
              title: const Text('Personajes'), //esto llevara a la pantalla de personajes de HxH
              onTap: () {
                Navigator.pop(context);
              },
              //ya estamos en esta pantalla
              //asi que no hacemos nada
              selected: true, // Esta es la pantalla actual
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ), //termine el menu lateral,

      // Ahora el contenido es una lista de Cards con imágenes
      body: ListView.builder(
        itemCount: pixelArt.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              height: 120,
              child: Image.asset(
                pixelArt[index],
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}